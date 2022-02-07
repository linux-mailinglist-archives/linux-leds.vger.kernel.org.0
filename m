Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC8D4AC3FD
	for <lists+linux-leds@lfdr.de>; Mon,  7 Feb 2022 16:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344178AbiBGPid (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Feb 2022 10:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357429AbiBGPZP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Feb 2022 10:25:15 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F479C0401C1
        for <linux-leds@vger.kernel.org>; Mon,  7 Feb 2022 07:25:14 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cn6so8144239edb.5
        for <linux-leds@vger.kernel.org>; Mon, 07 Feb 2022 07:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IFA5wpjGS07XJikgbFpWtnglEjHE1vQwFYtTw72u5qs=;
        b=j4TB5X0uM7Zgs5mPCVY3WBBeiTVRab04iIFUFL6d8G3yO1cBrvDYRvTdaI/fj3xhYR
         z0eDu0+RC5yiDTJ4xVPR47TTWXCPBDn9W7MNNy0mzTaTQ+mrSCfW+/Eg05dZfA+ZdJsg
         DoddThc2H1diRTpzFKziKA2gePsu/ogyIMVokiXsad3Vbp0wSRig9aUhBUetdgsY5C2u
         dD15J9PxzFPojAzjB90xRsqOl8PKTgzYL52YTiRKQHW7kfPGaqz0dyg0tIsXIG9ePrun
         SCfOotBgRCr8INWwJ+DDA9e955uDikrGgpZY8fqDxuF2hMywmGWRCvLe7Y6IDSiMHgKu
         aKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IFA5wpjGS07XJikgbFpWtnglEjHE1vQwFYtTw72u5qs=;
        b=v/Pu2HVHMqoBmO7hkK01Syy4Fmvb7oMJJoN5bMLZ0UX8LVoI6tYRz+xxIPjvuQ+y2S
         fjIZsFBwwhUbNPbPV415mw2dMbbs1jPYLjw/EQPiSqnpbABIqvuoJBmg3EFxm1t9RWcv
         Xh2XUhIQP/UtNn8xAMbudmV1Mn5CABzXMfM7wF1qNTfV5sez+bGRym9AixRXDsYwjxQg
         BTTm2YALFnsEMg7vFnTSJEbA+hnKFNVoYYUukBjyAr7Ox5n/oEzdzYxI5si+bCVBsWIf
         fBrGxRBwemXEGQTDgCZIk9fu0nmu+RumoNtR9Q6fVe5kOqzyivN5tI33IWVTRDYE/m1T
         lYkg==
X-Gm-Message-State: AOAM530untyHFltz2Oo2ORxDzIrhotGSHjSDUR/b/4DK73yeUGAEszih
        yVOXmRx0Yf2L6D8VJKR0i6L56Lk6yxjIhUXy/yk=
X-Google-Smtp-Source: ABdhPJzxGWdMvr+dCqQTdeIPXg0fyC5ZNcDmYulxvOjOZDTcR3O4lST5Jn8Pu5Py35jAwdMoQfFFLET/Qs5txkxX+ok=
X-Received: by 2002:a05:6402:1705:: with SMTP id y5mr3771edu.200.1644247512846;
 Mon, 07 Feb 2022 07:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Feb 2022 17:23:40 +0200
Message-ID: <CAHp75VdHjN94JXsfdF+K-zG2RL_mtZov3aB+4wdQKO8BRKBhgQ@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3692x: Return 0 from remove callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Feb 7, 2022 at 5:08 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The only difference between returning zero or a non-zero value is that
> for the non-zero case the i2c will print a generic error message
> ("remove failed (-ESOMETHING), will be ignored").
>
> In this case however the driver itself already emitted a more helpful
> error message, so the additional error message isn't helpful at all.
>
> The long-term goal is to make the i2c remove callback return void, making
> all implementations return 0 is preparatory work for this change.

...

> +       lm3692x_leds_disable(led);

Since it emits a message, perhaps converting it to void also can be
done here. Otherwise what's the point to have it int?

--=20
With Best Regards,
Andy Shevchenko
