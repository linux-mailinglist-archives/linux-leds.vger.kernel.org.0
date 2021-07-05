Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393A13BC17C
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jul 2021 18:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhGEQRR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Jul 2021 12:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhGEQRQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Jul 2021 12:17:16 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4180C061574;
        Mon,  5 Jul 2021 09:14:38 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id u11so21275587oiv.1;
        Mon, 05 Jul 2021 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PZe1w/0fw0ad7aMWKSuUHt6WMQscH3aipXU3FvsS3BQ=;
        b=kR0L3xd0J9OaDzxyB9hwRrXkG39MPTZUMMQ8Buo1Glq0/kRgC5wVlIGDHLF4xx90v5
         qqSDRCU72+H6q3EUxqJJa2ILSXXimGt8q9IBWuXorqKc0LXFhZFOboEZI12SXtB06VGZ
         WTEiT6IUnZ46YcWWXBCpk2bgvF3t2eSlAHcP1MyUM9b7XMYv0KDEA0Z0/R8sbCb3zcO6
         Scqh1SNX1I2s8CkCKrzjr+GRD/haCBA9R7y87+ruJkmTp6+EUDmSLw1B8etLCsoK8Jel
         sE3Rf0lmvjJttT1moMuwN9Iarn11SJQgC6D/XtVaX24vzXwW/uO/YlBG2C5RSmNQaSta
         MdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PZe1w/0fw0ad7aMWKSuUHt6WMQscH3aipXU3FvsS3BQ=;
        b=RyapEa7AYXGKXPrwk9fg4K6pJck2PX9Kyd+PSK+IjJYUMxzhsi9LOP8e1rQ6APuSAN
         jltFK5dpHaPLrJZxYChXAzhLog7D6oOSopzg2f1n+sEKZDPpWz+VTnhXD3Tjc9zrPprk
         9fKlBVfBBTzQQLo72TXbVk43IdyYsgMI34PfW3wcW7AUd4tFXHxJukmsjexKEj5nbRbg
         aAxIA2+A/n1o4loh0jyMEZwb6CLLN0jKTwebqqJUMgv4Z/vWzdPFFGB9n4E2Y6GMV9Du
         VeoYXuBWu1lTa+QFQLO5H65uAlMUBDLJrXkkl670AdvpDTnDvVriL1fP0X19waS+e0gL
         TKmA==
X-Gm-Message-State: AOAM532ds0HMHDCC2QtS8WaxTKVjcifucXjrBbeMUWy5sSzowprwBeRi
        K1xKuwTJmAu59rto1x68ipA=
X-Google-Smtp-Source: ABdhPJyLe4DcnjZTq9fBZ9ZAYMzpVZ0ARCrMBKcMajfTPirfG9t8r1vxHGyMkvxlUbB8OLHkqNDl7w==
X-Received: by 2002:a05:6808:6cf:: with SMTP id m15mr10759511oih.39.1625501678373;
        Mon, 05 Jul 2021 09:14:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w15sm838276oie.21.2021.07.05.09.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 09:14:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 6/7] Documentation/hwmon: Add iei-wt61p803-puzzle hwmon
 driver documentation
To:     Pavo Banicevic <pavo.banicevic@sartura.hr>,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, corbet@lwn.net,
        lee.jones@linaro.org, pavel@ucw.cz, robh+dt@kernel.org,
        jdelvare@suse.com, goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr
Cc:     Robert Marko <robert.marko@sartura.hr>
References: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
 <20210705134939.28691-7-pavo.banicevic@sartura.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7f1e783f-1049-ebe0-23c4-cf3a92d4f623@roeck-us.net>
Date:   Mon, 5 Jul 2021 09:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705134939.28691-7-pavo.banicevic@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/5/21 6:49 AM, Pavo Banicevic wrote:
> From: Luka Kovacic <luka.kovacic@sartura.hr>
> 
> Add the iei-wt61p803-puzzle driver hwmon driver interface documentation.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>   .../hwmon/iei-wt61p803-puzzle-hwmon.rst       | 42 +++++++++++++++++++

Needs to be added to index.rst.

>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
> 
> diff --git a/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
> new file mode 100644
> index 000000000000..04b01e53760c
> --- /dev/null
> +++ b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst > @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver iei-wt61p803-puzzle-hwmon
> +=======================================
> +
> +Supported chips:
> + * IEI WT61P803 PUZZLE for IEI Puzzle M801
> +
> +   Prefix: 'iei-wt61p803-puzzle-hwmon'
> +
> +Author: Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +
> +Description
> +-----------
> +
> +This driver adds fan and temperature sensor reading for some IEI Puzzle
> +series boards.
> +
> +Sysfs attributes
> +----------------
> +
> +The following attributes are supported:
> +
> +- IEI WT61P803 PUZZLE for IEI Puzzle M801
> +
> +/sys files in hwmon subsystem
> +-----------------------------
> +
> +================= == ===================================================
> +fan[1-5]_input    RO files for fan speed (in RPM)
> +pwm[1-2]          RW files for fan[1-2] target duty cycle (0..255)

There are also temperature sensors.

> +================= == ===================================================
> +
> +/sys files in thermal subsystem
> +-------------------------------
> +
> +================= == ====================================================
> +cur_state         RW file for current cooling state of the cooling device
> +                     (0..max_state)
> +max_state         RO file for maximum cooling state of the cooling device
> +================= == ====================================================
> 

