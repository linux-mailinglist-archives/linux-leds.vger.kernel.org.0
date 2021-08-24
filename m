Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C93E3F6133
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 17:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbhHXPB1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 11:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbhHXPB1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 11:01:27 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0074C061757;
        Tue, 24 Aug 2021 08:00:42 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso46794657ott.13;
        Tue, 24 Aug 2021 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y10GS9FWoLqJFpkFeNsSYaLQLC4RZsEaOSelIWqnQdE=;
        b=TeXBR/v1OJwFA9JRToOZ5G0CcnQBuTZi2INs2HReuzBtB4GzBbGmoRXER7oCdHsuRC
         4VE7bpAqKiKCTxsN/8a+HJiCHq62QjwQ1bYncwhtcpmNloRNIEsPJDnWaBK1IJMGTrnw
         8lt+uRPI4PbtMmGOvenqzsH+7Qj3wxy+P2yXme4xHFoHzeo/M4X+3b+JRbCHv/1liwJ8
         yW9MXo0vVI5gB4/0xeeVxQtwP08ICw5JnXzPiMb0FSepz6olMKHNusrGjRDcn9izFVvb
         bpVSv+xiZtOdgdQ3OnNoBf87r5gyL9ZqrhJKg97pAWm4YRJYMCULFm3W4Dr7wYpfrpiX
         YGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=y10GS9FWoLqJFpkFeNsSYaLQLC4RZsEaOSelIWqnQdE=;
        b=H7MEVlwPpPMM0AsHXzEtYsgrQ7nibJNh5e7dsGNknSisXSIsOJ+e/kAlZYWJhRwNMv
         e7wHUOHl8cdlb2XFMYipuZaKOhBHUez71Ua0rm7xUgvr7cOhCgI4DTpaGgtxAuq5xZ7v
         rxAAQBd/d384j+qI4dV3/0blLKlG/Lfplj4tBgfzpVoiffYT8qGf4kmGxILTjMfqE/Yd
         iKUAj/52KDdAW4IEPzoHH0VpYY/392qgK9wmI9cY1BziTKIEgr+goT268HZrT3fpqcrx
         WZOqZoq4ioV7CYIkKiacUVj6Ni3Bz8h5VSDjjgvJCQN1AB0E5Z+cE/BRrg0hqRs7ZAxV
         iKIg==
X-Gm-Message-State: AOAM5330evyVeC1sA0F6yz3JzupYlvGjpHcJr3yfU5T2BqaTnmR++J18
        bhuR93VNWTkoskErK/RNO6Q=
X-Google-Smtp-Source: ABdhPJzVoIwHxCZaaXnlriUCSVIGvM4ROtAQPQdNLbBTmtzVgtrvqvW4fPeBlbNj/cj5DrFy6438Aw==
X-Received: by 2002:a9d:6215:: with SMTP id g21mr18354917otj.116.1629817242215;
        Tue, 24 Aug 2021 08:00:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm4103459oof.37.2021.08.24.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:00:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Aug 2021 08:00:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, jdelvare@suse.com, goran.medic@sartura.hr,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v9 6/7] Documentation/hwmon: Add iei-wt61p803-puzzle
 hwmon driver documentation
Message-ID: <20210824150039.GA3394576@roeck-us.net>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-7-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824124438.14519-7-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 24, 2021 at 02:44:37PM +0200, Luka Kovacic wrote:
> Add the iei-wt61p803-puzzle driver hwmon driver interface documentation.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../hwmon/iei-wt61p803-puzzle-hwmon.rst       | 43 +++++++++++++++++++
>  Documentation/hwmon/index.rst                 |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
> 
> diff --git a/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
> new file mode 100644
> index 000000000000..bbbe97645965
> --- /dev/null
> +++ b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
> @@ -0,0 +1,43 @@
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
> +================= == =====================================================
> +fan[1-5]_input    RO files for fan speed (in RPM)
> +pwm[1-2]          RW files for fan[1-2] target duty cycle (0..255)
> +temp[1-2]_input   RO files for temperature sensors, in millidegree Celsius
> +================= == =====================================================
> +
> +/sys files in thermal subsystem
> +-------------------------------
> +
> +================= == =====================================================
> +cur_state         RW file for current cooling state of the cooling device
> +                     (0..max_state)
> +max_state         RO file for maximum cooling state of the cooling device
> +================= == =====================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index bc01601ea81a..4a050a5bc1f8 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -73,6 +73,7 @@ Hardware Monitoring Kernel Drivers
>     ibmaem
>     ibm-cffps
>     ibmpowernv
> +   iei-wt61p803-puzzle-hwmon
>     ina209
>     ina2xx
>     ina3221
> -- 
> 2.31.1
> 
