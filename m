Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13425BE051
	for <lists+linux-leds@lfdr.de>; Tue, 20 Sep 2022 10:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbiITIgQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Sep 2022 04:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiITIfq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Sep 2022 04:35:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A22760D9
        for <linux-leds@vger.kernel.org>; Tue, 20 Sep 2022 01:34:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e16so3032207wrx.7
        for <linux-leds@vger.kernel.org>; Tue, 20 Sep 2022 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=7dig1GtQ/tEPwoZ4IzdJc0cpEnbdsM6syJJvtSDbwpI=;
        b=yvLC1vybOUQuV+stHrnJh9iyMJV4g1pSagySg0qynq91oN4cRv/dERTiAJHARBIqlm
         5qjjZ+To8uCXnDY+W25wE035urdvhSJarbdZaqj7jKHGi20VkoxqlqTComp1Kqk1gqcT
         BvMRA9u3e1l0v9szrV/A3CoyWi8mJlAl+JljcjzThCBfvlGzUMKGqmdEKR5ZCgFcvcNb
         MjyZgBtsQlhCtU2es2jPmk+Bs2SvzTQaWkQWdWDnw098pb2ILJW/0bBUnoH9hZXk7xcj
         NP8vFyfwqT5cCndgpmgbbhRLNWHZiQQHkY5JPjXo41N96n3YSWQNQi6WL1dVpef2g+GR
         MKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7dig1GtQ/tEPwoZ4IzdJc0cpEnbdsM6syJJvtSDbwpI=;
        b=cAoDItc6CIS6LTBdZi1DI31k0zxW1s8pkj68GivxioSq4LawrLZCitKl1qguhJbDgX
         qfzEuIDvf9wR2fJ4aSicem+CTcv3uXkA7CudMJGdH3CGPptsmn4MvIhLy3u48H05xnH4
         OxqyARQrrfvqUU25Kmx4KlBNNCs5nD0u+leTuQQpE5yKF/uEZqPlZAy+zzF/lzx16Jld
         CsE/BaGlRSKSdNyw/rPS9ey0B3FEKad/B/TAXdhcA66+zbbowD7ibEtv2kLCBMA2TIcr
         OaOwcXMHvPiteO91/EYcqJfIPY1ZEVD5bSAZTvZlso/MBDz7MjQi5cuy9p4WQwcz/qe1
         7oIA==
X-Gm-Message-State: ACrzQf2ZJP8FPQjwyyooYZeF9G4dFRc/Tcd10NDpFp25j2r6Pv/C7WSK
        RfMXnrP9XYSZuh1tlHXoGv0qFg==
X-Google-Smtp-Source: AMsMyM51JMp2g0kDyTQ3pTTEYuXEem/0wGut1EFlUKyW2HmW+6jlwAcoreFPisCkoQZc1sAjIQVHNQ==
X-Received: by 2002:adf:f909:0:b0:225:c35:8242 with SMTP id b9-20020adff909000000b002250c358242mr12959229wrr.550.1663662885080;
        Tue, 20 Sep 2022 01:34:45 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b003b47b913901sm2209317wmq.1.2022.09.20.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:34:44 -0700 (PDT)
Date:   Tue, 20 Sep 2022 09:34:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org, kabel@kernel.org,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v11 0/2] Introduce block device LED trigger
Message-ID: <Yyl7I5H157Eci5UI@google.com>
References: <20220915205018.447014-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915205018.447014-1-arequipeno@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 15 Sep 2022, Ian Pilcher wrote:

> Summary
> =======
> 
> These patches add a new "blkdev" LED trigger that blinks LEDs in
> response to disk (or other block device) activity.  The first patch is
> purely documentation, and the second patch adds the trigger.
> 
> It operates very much like the netdev trigger.  Device activity
> counters are checked periodically, and LEDs are blinked if the correct
> type of activity has occurred since the last check.  The trigger has no
> impact on the actual I/O path.
> 
> The trigger is extremely configurable.  An LED can be configured to
> blink in response to any type (or combination of types) of block device
> activity - reads, writes, discards, or cache flushes.  The frequency
> with which device activity is checked and the duration of LED blinks
> can also be set.
> 
> The trigger supports many-to-many "link" relationships between block
> devices and LEDs.  An LED can be linked to multiple block devices, and
> a block device can be linked to multiple LEDs.  To support these
> many-to-many links with a sysfs API, the trigger uses write-only
> attributes (link_dev_by_path and unlink_dev_by_path) to create and
> remove link relationships.  Existing links are shown as symbolic links
> in subdirectories beneath the block device and LED sysfs directories
> (/sys/class/block/<DEVICE>/linked_leds and
> /sys/class/leds/<LED>/linked_devices).
> 
> As their names indicate, link_dev_by_path and unlink_dev_by_path each
> take a device special file path (e.g. /dev/sda), rather than a kernel
> device name.  This is required, because the block subsystem does not
> provide an API to get a block device by its kernel name; only device
> special file paths (or device major and minor numbers) are supported.
> 
> (I hope that if this module is accepted, it might provide a case for
> adding a "by name" API to the block subsystem.  link_dev_by_name and
> unlink_dev_by_name could then be added to this trigger.)
> 
> The trigger can be built as a module or built in to the kernel.

My I ask how I ended up on Cc for this set please?

-- 
DEPRECATED: Please use lee@kernel.org
