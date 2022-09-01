Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF0C5A9B68
	for <lists+linux-leds@lfdr.de>; Thu,  1 Sep 2022 17:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbiIAPUP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Sep 2022 11:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbiIAPUN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Sep 2022 11:20:13 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C24A3205C
        for <linux-leds@vger.kernel.org>; Thu,  1 Sep 2022 08:20:11 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z8so14254081edb.6
        for <linux-leds@vger.kernel.org>; Thu, 01 Sep 2022 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Q6mBPFQpA06ZvWUnOEBda1D5SKhKuxvQbDfHBpf3uwc=;
        b=Kw/EoRfWoshcdSsSEeJr6RNkQ3rmFQFy4BcuBRdDcXp9SQSg7EyYGf8Wv929UeL19E
         46wzxNxWgMPlwMQOCBxq0/FEbjdwRZ1tW84RaosNaJFpZ0VIt38j4l2Lg5uJPZT90CiR
         wgiRel239a1f0EJmYA/oSeM0+X6+hYVrmnAyELAit4wbh3wAd/QUjrq7M5yRXQ60GjvH
         5fieFSd0Q8FhH+QKuO4o++KGJ7WSjzxpCPu4zlcPRV+0piF4P5MDOcKA+LvIWcZjuKSD
         3o9httpKBNq2k0Q5ozGB5D3TdTH+jRiO/Kw+FKdZQk/elpH/M7zyVqcuIluE+C9YCvrT
         p/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Q6mBPFQpA06ZvWUnOEBda1D5SKhKuxvQbDfHBpf3uwc=;
        b=Tq4cduS/obNzIRRCRaX7aJ95YqfyNUjde3Aj49bbYZgVKm1PBlzSlQb5JnNNyg0fLz
         fa40PqPsT/+1/kjPZ8Y8i3uwpMf5GpH40/Zl3vYarvM5WAVMTzrXYFqcj4N4SMU6SWKf
         OH9PRVumjL1xggNSyxh9E9ZI6GgffG6u1+JMM4swDZILRjFAZ4fz8ZSQgkgC4lOvSYcv
         Gwf6x7jwIYp9EGDaSRGOijGOnJ1/Z8ZOjGPWgb2n/BpbSMLD5qoyJC530ggHDk+cf8Xc
         YaVj79jlRyBu9GJmMymflNkmGS3OPPCYdiJTmOhuc2r9uwHPPPYB+VHKVAM9DTnVXfRR
         eQbw==
X-Gm-Message-State: ACgBeo36SeyfLAASo0/9eafGw3SepMRp6U+njq78Zxn4h9yG7zXwlTOw
        H7/VsUhl80YtRSW9Y10gPoQT1vPNGJIqwz7x/8HG8w==
X-Google-Smtp-Source: AA6agR5EiqW8yi4rig6EGzVf96EbDsC2nA3KamdLRmLfuxYLnfdyAOimOKpKepGbWdH7MVblW4fMOcn8lYH3DDQBXLs=
X-Received: by 2002:a05:6402:71a:b0:447:ebb2:18f2 with SMTP id
 w26-20020a056402071a00b00447ebb218f2mr24571735edx.408.1662045609686; Thu, 01
 Sep 2022 08:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104422.14156-1-henning.schild@siemens.com> <298e6d86-dc7b-ed24-893d-2211017463bb@redhat.com>
In-Reply-To: <298e6d86-dc7b-ed24-893d-2211017463bb@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Sep 2022 17:19:58 +0200
Message-ID: <CAMRc=McxL0KEb+KHTcTAW1NC91Jx8uNAt9AAaLrH97oAA_0SZA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch with 6.0-rc1 + "[PATCH v6 0/7] add
 support for another simatic board" series
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 1, 2022 at 4:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Dear GPIO and LED subsystem maintainers,
>
> Here is a pull-request for v6.0-rc1 + the
> "[PATCH v6 0/7] add support for another simatic board" series
> for merging into the gpio and leds subsystems.
>
> Regards,
>
> Hans
>
>
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
>
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-simatec-1
>
> for you to fetch changes up to 8f5c9858c5db129359b5de2f60f5f034bf5d56c0:
>
>   platform/x86: simatic-ipc: add new model 427G (2022-09-01 16:15:03 +0200)
>
> ----------------------------------------------------------------
> Tag (immutable branch) for:
> v6.0-rc1 + "[PATCH v6 0/7] add support for another simatic board" series
> for merging into the gpio, leds and pdx86 subsystems.
>
> ----------------------------------------------------------------
> Henning Schild (7):
>       gpio-f7188x: switch over to using pr_fmt
>       gpio-f7188x: add a prefix to macros to keep gpio namespace clean
>       gpio-f7188x: Add GPIO support for Nuvoton NCT6116
>       gpio-f7188x: use unique labels for banks/chips
>       leds: simatic-ipc-leds-gpio: add new model 227G
>       platform/x86: simatic-ipc: enable watchdog for 227G
>       platform/x86: simatic-ipc: add new model 427G
>
>  drivers/gpio/Kconfig                               |   3 +-
>  drivers/gpio/gpio-f7188x.c                         | 275 ++++++++++++---------
>  drivers/leds/simple/simatic-ipc-leds-gpio.c        |  42 +++-
>  drivers/platform/x86/simatic-ipc.c                 |  10 +-
>  include/linux/platform_data/x86/simatic-ipc-base.h |   1 +
>  include/linux/platform_data/x86/simatic-ipc.h      |   2 +
>  6 files changed, 216 insertions(+), 117 deletions(-)
>

Pulled, thanks!

Bart
