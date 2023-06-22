Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B3C73A69D
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jun 2023 18:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjFVQzI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Jun 2023 12:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjFVQym (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jun 2023 12:54:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242D72703
        for <linux-leds@vger.kernel.org>; Thu, 22 Jun 2023 09:54:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73B60618C4
        for <linux-leds@vger.kernel.org>; Thu, 22 Jun 2023 16:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E05C433C8;
        Thu, 22 Jun 2023 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687452852;
        bh=WvPMeVtT8HySVlQQYfCD9Qi6NPFDyHkTCRsPrIqcEts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SX7wwboWbkVlRORAbsFOmJf2/KjqoskquLbeQwt+WXUKFFFnqejBShUZNP5XQqqW5
         Gru5bbKxs0zW/wV9kc4I5TKWsKB4mpc6m/Rlep7PmPdqLgn6mOOz6Kus6gzuDeoVAn
         xLCsreE+Ecnf7a1GwyDPTTHbxWEkcJRSSylevY3IM4wnhmsxXyXylitOf09tivZUs7
         2HpPWw+jNAth/cJN/BGsX+iR18YKfUIOM2rj1uHUzhDLBkkH24CN9biidt0kit6Lvi
         Yv7MCDrlnip/SDDTMrnNPh3Lff+sgVqReI55CVfw9JiFuu3hiKLGie9mRWHKoSF6Om
         mkCMBtHv0JaTg==
Date:   Thu, 22 Jun 2023 17:54:05 +0100
From:   Lee Jones <lee@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>, sean.wang@mediatek.com,
        pavel@ucw.cz, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, trix@redhat.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Subject: Re: [PATCH] leds: leds-mt6323: Adjust return/parameter types in wled
 get/set callbacks
Message-ID: <20230622165405.GX10378@google.com>
References: <20230622-mt6323-wled-wincompatible-function-pointer-types-strict-v1-1-6ad256f220e8@kernel.org>
 <CAKwvOd=jHrch4a-AZgXmScGKW2Fs4MHwH0iaW_8PgR=iYfvrEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=jHrch4a-AZgXmScGKW2Fs4MHwH0iaW_8PgR=iYfvrEg@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 22 Jun 2023, Nick Desaulniers wrote:

> On Thu, Jun 22, 2023 at 9:12 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Clang's kernel Control Flow Integrity (kCFI) is a compiler-based
> > security mitigation that ensures the target of an indirect function call
> > matches the expected type of the call and trapping if they do not match
> > exactly. The warning -Wincompatible-function-pointer-types-strict aims
> > to catch these issues at compile time, which reveals:
> >
> >  drivers/leds/leds-mt6323.c:598:49: error: incompatible function pointer types assigning to 'int (*)(struct led_classdev *, enum led_brightness)' from 'int (struct led_classdev *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >    598 |                         leds->led[reg]->cdev.brightness_set_blocking =
> >        |                                                                      ^
> >    599 |                                                 mt6323_wled_set_brightness;
> >        |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  drivers/leds/leds-mt6323.c:600:40: error: incompatible function pointer types assigning to 'enum led_brightness (*)(struct led_classdev *)' from 'unsigned int (struct led_classdev *)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >    600 |                         leds->led[reg]->cdev.brightness_get =
> >        |                                                             ^
> >    601 |                                                 mt6323_get_wled_brightness;
> >        |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  2 errors generated.
> >
> > While 'unsigned int' is ABI compatible with 'enum led_brightness' (hence
> > no warning from -Wincompatible-function-pointer-types) and the callers
> > of these callbacks use/pass the values as 'unsigned int', the mismatch
> > between the prototype and the called function will trip kCFI at runtime.
> >
> > Change the types in the implementations to match the prototypes, clearing
> > up the warning and avoiding kCFI failures.
> >
> > Fixes: 9bb0a9e0626c ("leds: leds-mt6323: Add support for WLEDs and MT6332")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch! Consider additionally having
> mt6323_get_wled_brightness return LED_OFF rather than 0 in its
> ternary.

https://elixir.bootlin.com/linux/latest/source/include/linux/leds.h#L32

Perhaps this is not relevant for this older driver though?

I'd really like some more information from Pavel on the history.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> 
> > ---
> >  drivers/leds/leds-mt6323.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> > index e8fecfc2e90a..24f35bdb55fb 100644
> > --- a/drivers/leds/leds-mt6323.c
> > +++ b/drivers/leds/leds-mt6323.c
> > @@ -76,7 +76,7 @@ struct mt6323_led {
> >         int                     id;
> >         struct mt6323_leds      *parent;
> >         struct led_classdev     cdev;
> > -       unsigned int            current_brightness;
> > +       enum led_brightness     current_brightness;
> >  };
> >
> >  /**
> > @@ -451,7 +451,7 @@ static int mtk_wled_hw_off(struct led_classdev *cdev)
> >         return 0;
> >  }
> >
> > -static unsigned int mt6323_get_wled_brightness(struct led_classdev *cdev)
> > +static enum led_brightness mt6323_get_wled_brightness(struct led_classdev *cdev)
> >  {
> >         struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
> >         struct mt6323_leds *leds = led->parent;
> > @@ -471,7 +471,7 @@ static unsigned int mt6323_get_wled_brightness(struct led_classdev *cdev)
> >  }
> >
> >  static int mt6323_wled_set_brightness(struct led_classdev *cdev,
> > -                                     unsigned int brightness)
> > +                                     enum led_brightness brightness)
> >  {
> >         struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
> >         struct mt6323_leds *leds = led->parent;
> >
> > ---
> > base-commit: 7bd932d9adbcc5c5370d968bdb0b00385606bf3a
> > change-id: 20230621-mt6323-wled-wincompatible-function-pointer-types-strict-334f06d92ffb
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Lee Jones [李琼斯]
