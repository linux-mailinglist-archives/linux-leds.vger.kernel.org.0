Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32EA7696E2
	for <lists+linux-leds@lfdr.de>; Mon, 31 Jul 2023 14:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjGaM55 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Jul 2023 08:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbjGaM5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Jul 2023 08:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD0D10EB
        for <linux-leds@vger.kernel.org>; Mon, 31 Jul 2023 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690808220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MxMqYbXDgca7Zo00Ck+hxplFR8Ah4pQzZkZMPsG9f9s=;
        b=IdaLe+G2pCTmiwPosg/mrKG6ioD4jeEOjW0tFrtHWAqertilkPSgkgrjwAWQ+xln9yviUM
        4KJ1VLa6eb8NKyUWz4ODoRyxA+S2VuR/wGbVOnn6Q/MH9YjFnu7GkCvfFXPcBWHODOevGp
        rpKY4OJk6SKGZqzRlFvUhY1+TyLpeEI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Tq3IjRuoNSCajIk3kqYADw-1; Mon, 31 Jul 2023 08:56:58 -0400
X-MC-Unique: Tq3IjRuoNSCajIk3kqYADw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bebfada8cso196391466b.1
        for <linux-leds@vger.kernel.org>; Mon, 31 Jul 2023 05:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808217; x=1691413017;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxMqYbXDgca7Zo00Ck+hxplFR8Ah4pQzZkZMPsG9f9s=;
        b=YpykM/Xjxqsbugv7m7OaYGE3Lq44TuffcNU/5edX8YHIxKprFEzBfJ1GeI9Rav8dlh
         DyYqrboT+osvyH2xIFiAUbOeArd1pV0aq0ShHjAOMX61CC7Oq1qa/q9wLQrJSt0yjpwF
         JDTo9d3ntpPmtbPKO/k/L52lDvC+o6Rg0QG0C7HoZJmvKNaa3ZRvKzjkeXO7MPZjeGLW
         /WX6L9bUEomNzYR/u5yOrp9ihcL+ZniutznAdhYRBbx61tqDYOhfFuOdVlgdjCHxy2WT
         EU1eWI2IQvr5qqBkBjkwxTuRmrX7x/JhYf54ltGjVyFVuUuwsuUYETrfmNW/Xm8XY0kR
         KTkg==
X-Gm-Message-State: ABy/qLaG1Zc0gWKQsvMHiubodgzXoJYWDiUeG0xbVVZ261nW0CdBDb5T
        2F6NCU45DokQli27j58bsr9MUmNr8bBvebXxECjdlrZV2qO5Xk3J4zQAnqE6QOFlEG4UMtqnXl6
        lM7Yzf48HpmGx6QE262hGsA==
X-Received: by 2002:a17:906:3112:b0:973:d06d:545f with SMTP id 18-20020a170906311200b00973d06d545fmr5455027ejx.24.1690808217616;
        Mon, 31 Jul 2023 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGAviMwmpJs0KSJ+G23RyLgzszwVjqCaw+gK13SaeYs0iYj/rL8+vo0bW2loUHBzZRl25wWVw==
X-Received: by 2002:a17:906:3112:b0:973:d06d:545f with SMTP id 18-20020a170906311200b00973d06d545fmr5455018ejx.24.1690808217334;
        Mon, 31 Jul 2023 05:56:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709062b4e00b00992acab8c45sm6192228ejg.12.2023.07.31.05.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 05:56:56 -0700 (PDT)
Message-ID: <f16554b9-d34e-4e19-052b-c818ef81d361@redhat.com>
Date:   Mon, 31 Jul 2023 14:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between pdx86 and LED due for the v6.6
 merge window v2
To:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        "xingtong.wu" <xingtong.wu@siemens.com>,
        Gerd Haeussler <gerd.haeussler@t-online.de>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

Here is an updated pull-request for pending pdx86 simatic-ipc changes which
are a pre-requisite for merging the following *new* LED patch:

https://lore.kernel.org/linux-leds/20230731071833.4725-1-xingtong_wu@163.com/

Note this is a new/updated pull-request with pre-requisites for
the new LED patch linked above, this PR and the below diffstat are based
on top of the previous pull-request for the ib-pdx86-simatic-v6.6 tag,
which I believe you have already merged.

Regards,

Hans


The following changes since commit 8766addf665e9f0ace15cca894ba225e5a4d580a:

  platform/x86: simatic-ipc: use extra module loading for watchdog (2023-07-14 15:06:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/ib-pdx86-simatic-v6.6-2

for you to fetch changes up to c56beff2037549c951042d178de75e535818a98a:

  platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A (2023-07-31 14:24:44 +0200)

----------------------------------------------------------------
Immutable branch between pdx86 simatic branch and LED due for the v6.6 merge window

ib-pdx86-simatic-v6.6-2: v6.5-rc1 + ib-pdx86-simatic-v6.6 +
more recent pdx86 simatic-ipc patches for merging into
the LED subsystem for v6.6.

----------------------------------------------------------------
Henning Schild (4):
      watchdog: make Siemens Simatic watchdog driver default on platform
      leds: simatic-ipc-leds: default config switch to platform switch
      platform/x86: Move all simatic ipc drivers to the subdirectory siemens
      platform/x86/siemens: Kconfig: adjust help text

xingtong.wu (3):
      platform/x86/siemens: simatic-ipc-batt: fix bat reading in BX_21A
      platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A
      platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A

 drivers/leds/simple/Kconfig                        |  1 +
 drivers/platform/x86/Kconfig                       | 59 +-------------------
 drivers/platform/x86/Makefile                      |  6 +-
 drivers/platform/x86/siemens/Kconfig               | 64 ++++++++++++++++++++++
 drivers/platform/x86/siemens/Makefile              | 11 ++++
 .../{ => siemens}/simatic-ipc-batt-apollolake.c    |  0
 .../{ => siemens}/simatic-ipc-batt-elkhartlake.c   |  0
 .../x86/{ => siemens}/simatic-ipc-batt-f7188x.c    | 37 +++++++++----
 .../platform/x86/{ => siemens}/simatic-ipc-batt.c  | 22 ++++----
 .../platform/x86/{ => siemens}/simatic-ipc-batt.h  |  0
 drivers/platform/x86/{ => siemens}/simatic-ipc.c   | 12 +++-
 drivers/watchdog/Kconfig                           |  1 +
 include/linux/platform_data/x86/simatic-ipc-base.h |  1 +
 include/linux/platform_data/x86/simatic-ipc.h      |  2 +
 14 files changed, 130 insertions(+), 86 deletions(-)
 create mode 100644 drivers/platform/x86/siemens/Kconfig
 create mode 100644 drivers/platform/x86/siemens/Makefile
 rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-apollolake.c (100%)
 rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-elkhartlake.c (100%)
 rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-f7188x.c (65%)
 rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt.c (95%)
 rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt.h (100%)
 rename drivers/platform/x86/{ => siemens}/simatic-ipc.c (92%)

