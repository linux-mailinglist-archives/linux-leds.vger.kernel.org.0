Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9E013BFE
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 21:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfEDTpq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 15:45:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36823 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfEDTpq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 15:45:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id u17so6582208lfi.3;
        Sat, 04 May 2019 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mNaZxkA6cAftJZwdbDx4gfh0OUQP29HeXshkyN0YcPI=;
        b=QXlBFoKzYMNfZ5XC/GJJZ4RFSV3Zx1Dgw2v2XzroWRwdlut8Am4sOcexJJv0zl3NyZ
         5kukM29+mezG1ODSNIKYzTHFMEN2arsQ+ZI+2h6Y3nb9FIP4xMf5C0FxMBig1svrE5ji
         bHpqF/rMZuO9lwzCkPjWbqlIn6GBQmqKclbbIruy2Qy7oabXl6zqEAljJXc0/Lq7HNI6
         swFmwJcRGhnzXrEj0EcUJJw8kfzNJvsx7m6R3OSnfkJ1ugpz+SVWrkmMvHLkgnjbFl5W
         imo21gmeGkpdo1yGXlhhDrsU+EWudt2gkhQV/WPZTYGRD2KfbVS6TwJAIWN4ionTmLio
         wz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mNaZxkA6cAftJZwdbDx4gfh0OUQP29HeXshkyN0YcPI=;
        b=Q8NDj4Uygf7RykInT4k/SeaitWjAbgNtZtuuyWikGq7lmlN921g8b3yW6ovwmPBJY8
         p8rhLONJBX6sl/MObDT1OgZtqp/eLoKAEEvcSclvKtGdyS6o/x92hupdkl/T0Tw+R9+s
         hOysoM9dG1rtbIWB+gwUAvfB1yQ03wSbEavLukFrRRaVPKU1o4fyXZJ1yZzoDeyLV61v
         4LcxjjdAl7F7JhL42yzZw2GJ+MnN+EvzSqaD1R5aWJmwD8+nryAeW5xBJQJcXfVYGGOx
         No/Drfr64E7ugfZq084bQUG5nPQ+Q0Io8c5IiDa94Xd/PZNRrN5igOc47nusF77mCNyb
         mUBw==
X-Gm-Message-State: APjAAAXCG8JzoBzTfFpSfWNi11YcrV3+DMmvdMqTDo5d8y7qj1k+/aBC
        RV1Rmfg4L6U4+eRzHIcfN2A257L8
X-Google-Smtp-Source: APXvYqxt3XwIKxVZc7PHUFsAMrS2VCeKqLjaC0O7kX2IDCQ4YVpSWLYnOUSIbdm0PjGv2VkHnn6UKA==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr8978353lfg.133.1556999144783;
        Sat, 04 May 2019 12:45:44 -0700 (PDT)
Received: from [192.168.1.19] (cit41.neoplus.adsl.tpnet.pl. [83.31.43.41])
        by smtp.gmail.com with ESMTPSA id h12sm1230809lfj.45.2019.05.04.12.45.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 12:45:44 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     list@c-mauderer.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
Message-ID: <d1704398-ae90-b4e8-50d3-f9533d94ab2b@gmail.com>
Date:   Sat, 4 May 2019 21:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I missed two issues, please take a look below.

> On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
[...]
>> +- ubnt-spi,max_bright:    Value for the maximum brightness. Default 

 From DT POV the only valid reason for which max brightness level would
need to be limited is a protection against hardware damage. Please use
led-max-microamp property for that if this is the case. Otherwise such
setting can be skipped.

There are two bindings that allow for configuring max-brightness level
but they quite old.

>> value for that
>> +            is 63.
>> +- label:        A label for the LED. If one is given, the LED will be
>> +            named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
>> +

Please use just:

label : see Documentation/devicetree/bindings/leds/common.txt

-- 
Best regards,
Jacek Anaszewski
