Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396BB356B5A
	for <lists+linux-leds@lfdr.de>; Wed,  7 Apr 2021 13:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244702AbhDGLgy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Apr 2021 07:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240491AbhDGLgy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Apr 2021 07:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617795404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1+IGD1lFi/dtjGX1UdNt4cubGIxpuOkFLqRacFVurCI=;
        b=R3aJLZvYX2k9dZgWLnVQzFAjkEyVBEBaMQojTSvpGys6juDrs+3Kb5JVG80MrboLppkQBi
        T92oZrNZ9YkRmb2yF8l9Q2TM5apRHqQzgQrMOawuTqbEN91fazh2oqUJ5boQ7y0VYMSdqG
        OrIhjXrvs4fEEgIJOfII4o0hEcMR5dI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-ubZCFIaVOiW2wspBorRAUA-1; Wed, 07 Apr 2021 07:36:42 -0400
X-MC-Unique: ubZCFIaVOiW2wspBorRAUA-1
Received: by mail-ed1-f71.google.com with SMTP id o25so6563278edv.20
        for <linux-leds@vger.kernel.org>; Wed, 07 Apr 2021 04:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1+IGD1lFi/dtjGX1UdNt4cubGIxpuOkFLqRacFVurCI=;
        b=lEiyie8LoMcErODrDu7tiWPxOd6jH36KCGZIVTDcScGumj8DF6hRNUMn5DR14vtrrg
         fR78hg5lWmj6zv5INKZwd1mxrceTwxBZ9sO8j23b9w4tKyu84YnRncL2z1CQxK2/1qN2
         ogSnctdxx35HFwcIlizTvNB8kZdHauOzfncvrl7YzP4sV52r16a3VcTYxQ8vS/IaXc3b
         6nBiYNmLBTPhYK5uIHggS3cx63AdPYnp9E1uiKgyuQVxddfudcv4JPO3m77DoVBBTjrq
         2vcKq9yf8AYZ2Pv1fMzclHlV0Rckn4k0mz73q2KDXRPxA7NaHQUAdYffSicwjgw1OI0V
         o+Sg==
X-Gm-Message-State: AOAM530UeeJ0lOR2M1FW3l0Dn1YInCodXyualinrXFB0U0SOgneRieCs
        zxlLuXS/53P/04+SZyX2PjvCrVJI0E3vk2kEptyU8xr6tiIn0ARyutbbmcqtvQYicKfPxZNxCdN
        WMkZzWpfAd7Ap/NA42QN96Q==
X-Received: by 2002:a17:906:7257:: with SMTP id n23mr3242600ejk.412.1617795401462;
        Wed, 07 Apr 2021 04:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyo6Bx0tJj9Knj2TC6l9JiTcnZkCkuEq2/kr9RoYoc4xl3FRtc9Ws9ew27rjT4YhYAVTvm+Q==
X-Received: by 2002:a17:906:7257:: with SMTP id n23mr3242584ejk.412.1617795401306;
        Wed, 07 Apr 2021 04:36:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r26sm4127077edc.43.2021.04.07.04.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:36:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] add device drivers for Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
References: <20210329174928.18816-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <857d6cd4-839d-c42a-0aa7-8d45243981ee@redhat.com>
Date:   Wed, 7 Apr 2021 13:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210329174928.18816-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/29/21 7:49 PM, Henning Schild wrote:
> changes since v2:
> 
> - remove "simatic-ipc" prefix from LED names
> - fix style issues found in v2, mainly LED driver
> - fix OEM specific dmi code, and remove magic numbers
> - more "simatic_ipc" name prefixing
> - improved pmc quirk code using callbacks
> 
> changes since v1:
> 
> - fixed lots of style issues found in v1
>   - (debug) printing
>   - header ordering
> - fixed license issues GPLv2 and SPDX in all files
> - module_platform_driver instead of __init __exit
> - wdt simplifications cleanup
> - lots of fixes in wdt driver, all that was found in v1
> - fixed dmi length in dmi helper
> - changed LED names to allowed ones
> - move led driver to simple/
> - switched pmc_atom to dmi callback with global variable
> 
> --
> 
> This series adds support for watchdogs and leds of several x86 devices
> from Siemens.
> 
> It is structured with a platform driver that mainly does identification
> of the machines. It might trigger loading of the actual device drivers
> by attaching devices to the platform bus.
> 
> The identification is vendor specific, parsing a special binary DMI
> entry. The implementation of that platform identification is applied on
> pmc_atom clock quirks in the final patch.
> 
> It is all structured in a way that we can easily add more devices and
> more platform drivers later. Internally we have some more code for
> hardware monitoring, more leds, watchdogs etc. This will follow some
> day.

IT seems there still is significant discussion surrounding the LED and watchdog
drivers which use patch 1/4 as parent-driver.

I'm going to hold of on merging 1/4 and 4/4 until there is more consensus
surrounding this series.

Regards,

Hans


> 
> Henning Schild (4):
>   platform/x86: simatic-ipc: add main driver for Siemens devices
>   leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
>   watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
>   platform/x86: pmc_atom: improve critclk_systems matching for Siemens
>     PCs
> 
>  drivers/leds/Kconfig                          |   3 +
>  drivers/leds/Makefile                         |   3 +
>  drivers/leds/simple/Kconfig                   |  11 +
>  drivers/leds/simple/Makefile                  |   2 +
>  drivers/leds/simple/simatic-ipc-leds.c        | 202 ++++++++++++++++
>  drivers/platform/x86/Kconfig                  |  12 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/pmc_atom.c               |  57 +++--
>  drivers/platform/x86/simatic-ipc.c            | 169 ++++++++++++++
>  drivers/watchdog/Kconfig                      |  11 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c            | 215 ++++++++++++++++++
>  .../platform_data/x86/simatic-ipc-base.h      |  29 +++
>  include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++
>  14 files changed, 769 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/leds/simple/Kconfig
>  create mode 100644 drivers/leds/simple/Makefile
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
>  create mode 100644 drivers/platform/x86/simatic-ipc.c
>  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc.h
> 

