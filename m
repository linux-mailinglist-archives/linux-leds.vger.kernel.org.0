Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E97F57D3A5
	for <lists+linux-leds@lfdr.de>; Thu, 21 Jul 2022 20:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbiGUSz6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Jul 2022 14:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbiGUSz5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2022 14:55:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E7D86C22
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 11:55:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A21F61E1B
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 18:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC884C341C6
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658429756;
        bh=8ipz0mYtVBhg7n1UTNdExKFVl99WSowx6NsU+VTf3dQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qQ7HR8CrQjj5ihE8rJP9/YT6Qux9jNzHlyduV4TMw8M4BMgxxhvTRESB3PTtxw8/0
         megPpOp96BLbpjsamM7A7P4HwvZ3rXhrk9EcQJVpMm5qai7EFeSmUe8BDPUzvlNpEv
         PLgcZQZlLD+137IdUd/rfXZofpuEVPRKXhy8cIO5pp5S/yTTQBrZ1245FcR210jFwy
         a3a7FN5XVtIMxEIAf5DI1mTYF2BqY7qTdl/nIK7A1MChavsOS/ptoBYAFqcui4B5wd
         ZczwRrGmmi5TueTa9xmvvHIvjB5Hi4Yi6mdGWtaSVNJVNMRxZuClVpNqIds/xRq2UX
         /lyVoVl5h+qVA==
Received: by mail-vs1-f44.google.com with SMTP id a63so648078vsa.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 11:55:55 -0700 (PDT)
X-Gm-Message-State: AJIora9xeFG5KVXqjEGRiHC5FlpALc9warVaT+UBuTOwnvVHxbfxOPRm
        py6yOpBqtVjF6JhvBLfr/8J2ACzmSG0cOSixXA==
X-Google-Smtp-Source: AGRyM1v6/71cZf/TduCEJsPQiZZVfsZRWFX7iaTY3mv+glGwn26tX235vEYiwoyZioVCAwdpxgYu79PRkpbmrqIYjLo=
X-Received: by 2002:a67:d194:0:b0:357:8ea:5554 with SMTP id
 w20-20020a67d194000000b0035708ea5554mr16769086vsi.0.1658429754907; Thu, 21
 Jul 2022 11:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
In-Reply-To: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 21 Jul 2022 12:55:43 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
Message-ID: <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
Subject: Re: DT bindings patches for LEDs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 21, 2022 at 10:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Hi Rob,
>
> It seems Pavel is recently quite busy [A] and few DT bindings patches
> are still pending. Maybe you could pick up instead:

Is Lee picking up things?

>
> 1.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-2-krzysztof.kozlowski@linaro.org/
> 2.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220721160611.250274-1-krzysztof.kozlowski@linaro.org/
> 3.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719074542.24581-1-krzysztof.kozlowski@linaro.org/

Applied all but this one. It depends on de40c8496ead ("dt-bindings:
leds: class-multicolor: reference class directly in multi-led node")
in Pavel's tree. I can apply in the merge window or after rc1 if
Pavel/Lee does not.

> 4.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719211848.1653920-1-marijn.suijten@somainline.org/
> 5.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-2-vincent.knecht@mailoo.org/
> 6.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-3-vincent.knecht@mailoo.org/
>
> Optionally:
> 7.
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-1-krzysztof.kozlowski@linaro.org/
> which was sent some time ago, to correct example with the bindings.
> However in LEDs tree there is a commit (multicolor) which exposes issue
> in original example, thus this maybe should go via LEDs tree as well.
> They are not strictly related, as this patch makes sense on its own.
>
> [A] https://lore.kernel.org/lkml/20220714222541.232eadfb@thinkpad/
>
> Best regards,
> Krzysztof
