Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C433DA7F1
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 17:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbhG2Pza (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 11:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237851AbhG2Pz3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 11:55:29 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7690EC061765;
        Thu, 29 Jul 2021 08:55:25 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u25so9005176oiv.5;
        Thu, 29 Jul 2021 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TV3s+6Ek9QNCMB+l3h/81KjOffdCml0U1KqwweGRv3M=;
        b=W3qmxYqU0FFMIiEndRoCpJYEarj9iL17Qe7ByS+YdVWNkwvbtvXREX8s9c/GmtnlLP
         saZpa5ulXRgF9yzHmUx2dwIrOfqU/nFOsn2iHVHe5lFJePtbTc3meLDC+ama3Fbjg0DE
         MYqSSBDEbTImMeNqshH0XSzTGmeSTPx70YmOXmO1gGA+fa18YGOXhtMm/Xz0/Ov8zeJN
         NB1jWH968HqaG6VZvwtz28OD7/3DS8vAn92RTP4T48JqjkGMhPcrGvAi6rr9bgjBhNUl
         eaccPi9gIM1z28VT5y+OSDQgY4/VCmJbZ2xPpH6UrRM9E4AsoNKVb0kNkeAkbZ4hTTrV
         Tjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TV3s+6Ek9QNCMB+l3h/81KjOffdCml0U1KqwweGRv3M=;
        b=FMqoGQtBuwEwuXIWg6P08raBxtXXWNqp3VRxLJ/6rhWmegmvDABKZJAylOk7g0gfqI
         rZGhubFmizHb/gyy98B37a1u7IlWKrPYwBcMxqKJyzZzt7y5139otJcHsRfDMcjWwK2I
         AhKdmtr9HfIlNwiqheagifQBF7t3prQ7fIfUmJ5eHepTYOE9NnsICWmrUom2YXI+9RVE
         4u90Hqs/tcNHoDh71l3f2dRs4s9CSKCwKiYUYreZGPAGRAVpi9j+8W2jAjtper710OLM
         VuNOIoWLbdMvy1+Hy/66dk0s7pJ1byuWcgn/4X7eZqWFsgRGncUrpwyLyk37V29uBbz1
         KHbw==
X-Gm-Message-State: AOAM532ttkLrQ/EB7m0FT2PIWe/cG9u+0MjCEKS0Nn/qKsr40Th2T6jA
        DmD5XsBzr6rGB3AoZmECg++7ge2Vi9jPG1Kz
X-Google-Smtp-Source: ABdhPJw+lDVr0eHFBVHNYdcQZ/0qtg70dFXQ9vTVwaLB6U8P5GaqHrNFJ7JH7FtQT5eCOpu1YrDzcQ==
X-Received: by 2002:a05:6808:144a:: with SMTP id x10mr3598431oiv.82.1627574124908;
        Thu, 29 Jul 2021 08:55:24 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id q187sm681208oif.2.2021.07.29.08.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 08:55:24 -0700 (PDT)
Subject: Re: [RFC PATCH 2/8] block: Add block device LED trigger list
To:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-3-arequipeno@gmail.com>
 <108872.1627528448@turing-police>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <b98e675d-0671-5dd9-766e-e422b68c3894@gmail.com>
Date:   Thu, 29 Jul 2021 10:55:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <108872.1627528448@turing-police>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/28/21 10:14 PM, Valdis Klētnieks wrote:
> Is this bisect-clean (as in "will it build properly with that config option
> set after each of the succeeding patches")?  Usually, the config option
> is added in the *last* patch, so that even if you have a bisect issue
> it won't manifest because it's wrapped in a '#ifdef CONFIG_WHATEVER'
> that can't possibly be compiled in because there's no way for Kconfig
> to set that variable.

Yes it is.  I tested compiling each patch with the CONFIG option both
enabled and disabled.  (You will get an unused function warning for
blk_ledtrig_find() until patch #3 is applied.)

I'll switch to adding the option in the last patch of the series in the
future.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
