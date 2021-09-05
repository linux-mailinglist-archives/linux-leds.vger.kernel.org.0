Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ACD401054
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbhIEOlC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhIEOlC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Sep 2021 10:41:02 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA204C061575;
        Sun,  5 Sep 2021 07:39:58 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id n27so5612406oij.0;
        Sun, 05 Sep 2021 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4hvdkJyjb4zgRDZv+KlXZjpnluSdqubIIHI0ogvJctY=;
        b=HLN8nB/G3JDR415KTqfMOlDvmU56tOwE4GInw+RWrYryrkBjaFzFOkcfP0KiGXjaHY
         c/ALauRg0r9GZpxiYECFCUAhNJyxuSqujtjh1JceGITJ1EhBs5FzBDBKK09BvU20F0SX
         cH/+eEtrsmvobVnRMSi73eRrDJ6eUiNfkzEbXF+29sibxyM19JK0NGvRaFaxLRCvmGgZ
         rIVzm8l9VsuBZcSLhgQ5aj2YX2f344JZeXTxDQ9dC8GYigvB6uviq3T6gfU7z6Y/OLNs
         wNaw84V5w80I59ohWgkNVsIqL6PuDQ7B1rCR6bPJwcZiuNa20Y03YfiefrxyBebnZeZp
         4qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4hvdkJyjb4zgRDZv+KlXZjpnluSdqubIIHI0ogvJctY=;
        b=h/St/wiBc1BSXHvP/CUzek9XJEHksNvSfnz++8wf61kcAXRpDOZ+GmylNMPgR4+rCr
         YAX5r2N8s0Nmvho7HF74nKjumzMWJoa8NMVUb2tazHY3Bgz1vda0D92btI67iRtMz9X9
         k+bh4EoMRL2TFpc9mBnB7AM9PWhfE+EsEglhhI/oQ5/9wCKPZddMPGmqsKxmLp4OAAI/
         qpH62U6DFuTOw6FGUwcfIEbbKo3ESjv/JSE4RZpzIH0o7QJqiD0h3FvM/OWhIziz4S/L
         e3LTSkvQUV0doC/C9YOF8kWyq5UH32Z6Rqygu5SKjzm0F4viPRZhGSKZKoBY2hmRYtAH
         oMpA==
X-Gm-Message-State: AOAM532GM4Fi7TGEMBeDpuICBqfIazj3pOje2Rz71GbU6yoAvsuAANhb
        14YmoTwnbins/dwfm9HX10Q=
X-Google-Smtp-Source: ABdhPJyrU2UHCeag9Y1i2Rdono3dBndgLcd0FPiLUzQSqEtz8r6BwY5t6XAN1UyK0a39mFc70pj0qQ==
X-Received: by 2002:aca:5889:: with SMTP id m131mr5443873oib.39.1630852798275;
        Sun, 05 Sep 2021 07:39:58 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r28sm940828oiw.45.2021.09.05.07.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 07:39:58 -0700 (PDT)
Subject: Re: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for
 activity & blink LEDs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-10-arequipeno@gmail.com> <YTMLxdQ3TFKPN+WH@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <8b0a2244-d81c-1099-927f-cfe9b04a4285@gmail.com>
Date:   Sun, 5 Sep 2021 09:39:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTMLxdQ3TFKPN+WH@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 1:01 AM, Greg KH wrote:
> Please never use WARN_ON() in new code unless the machine is really
> broken and you can not do anything else here.

Wait what?  I thought that was BUG_ON.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
