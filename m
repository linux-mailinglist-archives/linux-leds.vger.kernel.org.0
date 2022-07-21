Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F73A57D538
	for <lists+linux-leds@lfdr.de>; Thu, 21 Jul 2022 22:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiGUUz1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Jul 2022 16:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiGUUz0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2022 16:55:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE1D820F3
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 13:55:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC70C61241
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 20:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC14C385A2;
        Thu, 21 Jul 2022 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658436924;
        bh=xBeIMxKD861yf1PqRC6QOQnsZFwBxPVo2lSPtjGOSRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKEzl4BFvr2WCbxh6nTBWMStQF/6GgTItKqY0zXh7jDmeZcmDp07RiX+DPHUHlYky
         TIS7HdNKbYQVXj36iu2AqSVLuuYPZAR5lWC4kIKFcz7MQhumcWNN6aKiuDSSaLAyi5
         bG+TBDSwIk/AhhhqtJ+lcwB1K4kHj6TikXJ9TPvxLfpsFIlZW2P//QWQcKEC/Aw11Z
         xuspCM0BWpgg77a0fuqgeeHKW8JnyJjlC3Gh0bicmGpKQ8laGTPf8H/kIxauxus4Ns
         3rmH1W6+XTaUf14K5/Mt+kPXpebxE4+XTbpWj8QxmCc+QQT65uYp7H29e2auzwkjtl
         dKI5XyyPzORWA==
Date:   Thu, 21 Jul 2022 21:55:19 +0100
From:   Lee Jones <lee@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: DT bindings patches for LEDs
Message-ID: <Ytm9N0ZCKH9Rg4tD@google.com>
References: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
 <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 21 Jul 2022, Rob Herring wrote:

> On Thu, Jul 21, 2022 at 10:25 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Hi Rob,
> >
> > It seems Pavel is recently quite busy [A] and few DT bindings patches
> > are still pending. Maybe you could pick up instead:
> 
> Is Lee picking up things?

The offer is out.  Still waiting for Pavel to give the go-ahead.

> > 1.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-2-krzysztof.kozlowski@linaro.org/
> > 2.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220721160611.250274-1-krzysztof.kozlowski@linaro.org/
> > 3.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719074542.24581-1-krzysztof.kozlowski@linaro.org/
> 
> Applied all but this one. It depends on de40c8496ead ("dt-bindings:
> leds: class-multicolor: reference class directly in multi-led node")
> in Pavel's tree. I can apply in the merge window or after rc1 if
> Pavel/Lee does not.
> 
> > 4.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719211848.1653920-1-marijn.suijten@somainline.org/
> > 5.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-2-vincent.knecht@mailoo.org/
> > 6.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-3-vincent.knecht@mailoo.org/
> >
> > Optionally:
> > 7.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-1-krzysztof.kozlowski@linaro.org/
> > which was sent some time ago, to correct example with the bindings.
> > However in LEDs tree there is a commit (multicolor) which exposes issue
> > in original example, thus this maybe should go via LEDs tree as well.
> > They are not strictly related, as this patch makes sense on its own.
> >
> > [A] https://lore.kernel.org/lkml/20220714222541.232eadfb@thinkpad/
> >
> > Best regards,
> > Krzysztof

-- 
Lee Jones [李琼斯]
