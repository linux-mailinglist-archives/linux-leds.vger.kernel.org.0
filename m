Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB940B8370
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 23:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393033AbfISVcN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 17:32:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35340 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391333AbfISVcN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 17:32:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so4662613wrt.2;
        Thu, 19 Sep 2019 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fwnI8HToirwK2bIklFTcyBZ87fFKLO47S8keYN3k6FQ=;
        b=lNQKV3nNmbrQNcjrKrUeojO8E7jHg7Qx2Y3mYHKUo/tx+wdFhrFRF76iUQmcdxrkMj
         m/ktagEJ8KhYIawb7J0NQjSK02AZX0snp6VKgGb+CSfKQ+xXWUvmBX696BZzVMSTZKvk
         YFDqjGDJXuoL7V3C3AWzEuDlZCcF5QdV/pW/F3sWh06glblA2ADILRdLe974zKScnZ2H
         3w2UyxRJoI250DBf66o/ep8CBP4YfYCp0ESMF11qKZev07strnZZcenoAMuTz6cYZXU3
         wI3NlCu2cmL1JPEG22AHXt4F4vJzBZkiS+xQINz3xoNKEqwnx8AMKhdQb2W9UPBZM+S4
         yKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fwnI8HToirwK2bIklFTcyBZ87fFKLO47S8keYN3k6FQ=;
        b=XgUKmfXkjMarcJg3+05WBPzr0Ws8UpMaoghInthrr8xGVz5YXNdQJoa7r73tCRB86V
         ha+hWamuR6ywyJvV6MyPMP+WG+lBbI791DxKWwmN3kDKkOADfrhU2HT11KSG4sBDPZ8L
         92vAso6EGz+yQ7+l7bsxdcDyIP9gofQkUOxMUMDqW9Y3buf0/zXTR8MAMup1TG4j0fF7
         2lpysm2H0G+CGubOkqv7DIkF/QRqDo/pvo+kXzX1O+xGAtmFXUC66kaPISMWzpy24+u5
         5r9Cd8lrkvnXdV7vqguq+QIZnrPomRYEXri9BnaPX9WdO7NrfbudLlwQ2AQNg/jx0MYw
         qhdw==
X-Gm-Message-State: APjAAAWXD8xwcUuZq+0GaijZbIrhuYYmX1EBsMHLrJTUzXk6+zxv0hM0
        wchK5VCORDDKiZaBRoSlQo4lXx5h
X-Google-Smtp-Source: APXvYqzyl31UwF+WRMl297EZuxoAtqpnc32fbZXDrAIenYqteRRAK/1V9+1wzHeWDUfXOwDGyNCUDw==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr8193396wrv.315.1568928730067;
        Thu, 19 Sep 2019 14:32:10 -0700 (PDT)
Received: from [192.168.1.19] (bgr130.neoplus.adsl.tpnet.pl. [83.28.81.130])
        by smtp.gmail.com with ESMTPSA id g4sm10114368wrw.9.2019.09.19.14.32.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 14:32:09 -0700 (PDT)
Subject: Re: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190917175937.13872-1-dmurphy@ti.com>
 <20190917175937.13872-6-dmurphy@ti.com>
 <ff1d2ede-6bdf-8f73-9e89-0e990cce09a7@gmail.com>
 <e1de10a6-49ad-c7f2-9246-5bee29f58c80@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <045e1988-176c-b5ea-73cb-182b6210a3db@gmail.com>
Date:   Thu, 19 Sep 2019 23:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e1de10a6-49ad-c7f2-9246-5bee29f58c80@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/19/19 3:07 AM, Dan Murphy wrote:
> Jacek
> 
> On 9/18/19 4:27 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> I think Greg's guidance clarified everything nicely -
>> we will avoid <color> sub-dirs in favour of prefixes
>> to *intensity and *max_intensity.
> Yes I will make the change accordingly.  It will simplify the code.
>>
>> Before you will send an update I have some improvement
>> ideas regarding the remnants after the previous approach,
>> where single color intensity update resulted in updating
>> hardware state. Now the update will happen only on write to
>> brightness file, so we will not need color_set/color_get ops
>> anymore.
> 
> I left those call backs in specifically for the LP50xx. Otherwise the
> LEDs are only updated when the brightness file is written.

> The LP50xx has an engine that performs the intensity computation for the
> specific LED.  So there is no call back to the MC FW for calculating the
> intensity.
> 
> The brightness and intensity are written directly to the device and the
> MCU in the device does all the computations so you have real time update.

You can still handle that in brightness_set op. You need to compare
which color channels have changed and update them in hardware in
addition to setting LEDn_BRIGHTNESS register.

And yes - even updating a single color will need two operations:

echo 231 >  colors/red_intensity // only cache the color in MC core
echo 100 > brightness // do the actual hw update

Note that brightness value doesn't have to be necessarily different
from the previous one here, but writing brightness file will be needed
to trigger the hw update.

> For the LP55xx device the LEDs are only updated when the brightness file
> is written.
> 
> I think we can leave those call backs in if device driver or product
> development teams would like to use them.

I'd not do that - it will be confusing. We can accomplish everything
in brightness_set{_blocking} op. It will have also the advantage of
same ABI semantics across all devices. Otherwise we would need separate
documentation for devices like LP50xx.

I have also another question - what with linear vs logarithmic
LP50xx brightness scale? I think we should make both options available
to the userspace.

-- 
Best regards,
Jacek Anaszewski
