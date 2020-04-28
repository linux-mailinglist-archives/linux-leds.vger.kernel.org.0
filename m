Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD3F1BCDE3
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 22:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD1U7T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 16:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726284AbgD1U7T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Apr 2020 16:59:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE98C03C1AC;
        Tue, 28 Apr 2020 13:59:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k13so26379275wrw.7;
        Tue, 28 Apr 2020 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bX7CVm4iuAAH0o5R/PeSEAhxOdLA5OW7S2c0nbeGVLE=;
        b=CcbFZOAJoW4rbUWsHmcPHsHozHnEwTzRuvNz9U4/ZOJqq7utBjTfoH5CsO9JRnRHt1
         rEOmqSxfk+jIxroxX33JiucrCr075YNkEjON0QU4uOizE+3r0sh7mK+F2vGrV/vvuCES
         FoTSSq11Ih1J1UM/3FOwGhGdyN/8eNDDUDtnTZK+FqgFJNx0runA+pcXyRuGklSnO+in
         2i2nwJvuI8SaO9G7/mdOt+botVhpqc+jS9rEw/s8L2LbetUXplsy7XXXvS/R1xdFDeBR
         OmSuHD/0PUnOkqLSzTHbX7cV7oL6Ytf6rOtHCYxpJ9o7wW9ua3wlv+KCbk9fuPhqNFw7
         jJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bX7CVm4iuAAH0o5R/PeSEAhxOdLA5OW7S2c0nbeGVLE=;
        b=hP9d+MXMDbG41mAFgRGYfhjFstOgdSE7iqhQ6CFyf/49ovrlOPCybO50AVyaWyskap
         LqcjA9rdCiWjZj4Tx7gLqeFK1+qJ/F3Ik8CkigWLywroMJwIzdYOK5mX3b/gaKuFwrE3
         kkDnXyQe2JJDWNN3DhaQ+couvNdCxJjQ5z7nrL3S2JoyxMzuWy5vR59rcf0QP7Q3PP2b
         OLdYCa3+1OoyELfoonfOX8dWaVWfJLxi8FynfwVoDtcttYSBa5zbFjwSwSO9wZXAoENf
         FjsnsRw4JJ8QdGeIfdujJpg2z7Lh+QO5RR1jfA8Ho2Fwv4HtBLOZ+nbyGvgpwTz9FZl8
         Pgsw==
X-Gm-Message-State: AGi0PubRRQDmk1/2xFIXEIz1HXWfE4WrZ/dkd5d6G5ZdJRDo1+Xx32LS
        r9a5t3jDxauGO5/BQInAJ354ozfMBk8=
X-Google-Smtp-Source: APiQypIzhc0ywXqo4vqGCXspSNPcU0dqF/kQw5+cHvAnEwpWwC0M9ay3Hcy+bbNoPgkYKIQt4vlnQg==
X-Received: by 2002:adf:fcc6:: with SMTP id f6mr31635290wrs.388.1588107555779;
        Tue, 28 Apr 2020 13:59:15 -0700 (PDT)
Received: from [192.168.1.23] (afcs235.neoplus.adsl.tpnet.pl. [95.49.70.235])
        by smtp.gmail.com with ESMTPSA id o18sm26588411wrp.23.2020.04.28.13.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 13:59:15 -0700 (PDT)
Subject: Re: [PATCH v21 11/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-12-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5225c7bf-1e0d-5465-132e-54a3071cf518@gmail.com>
Date:   Tue, 28 Apr 2020 22:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428160338.2793-12-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 4/28/20 6:03 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig                      |   1 +
>   drivers/leds/leds-lp5521.c                |  14 +-
>   drivers/leds/leds-lp5523.c                |  14 +-
>   drivers/leds/leds-lp5562.c                |  13 +-
>   drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
>   drivers/leds/leds-lp55xx-common.h         |  14 +-
>   drivers/leds/leds-lp8501.c                |  14 +-
>   include/linux/platform_data/leds-lp55xx.h |   8 +
>   8 files changed, 209 insertions(+), 47 deletions(-)
> 

For patches 10/16 - 16/16:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
