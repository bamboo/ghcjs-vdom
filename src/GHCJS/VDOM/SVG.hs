{-# LANGUAGE QuasiQuotes, TemplateHaskell, OverloadedStrings  #-}

module GHCJS.VDOM.SVG ( custom
                      , fill
                      ) where

import GHCJS.VDOM.Internal
import GHCJS.VDOM.Internal.Types

import GHCJS.Foreign.QQ
import GHCJS.Types

custom :: (Attributes a, Children c) => JSString -> a -> c -> VNode
custom tag atts children = js_snode tag (mkAttributes atts) (mkChildren children)
{-# INLINE custom #-}

js_snode :: JSString -> Attributes' -> Children' -> VNode
js_snode tag (Attributes' props) (Children' children) =
  VNode [jsu'| h$vdom.s(`tag, `props, `children) |]

mkAttrs ''JSString [ "fill" ]
