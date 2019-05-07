Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EFC16BA4
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfEGTrR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:47:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33210 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEGTrR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:47:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id f23so15449398ljc.0
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9rEMmwDLlXmxCbmyNaBdtW6rBANiiUjWUTSN9vqyygM=;
        b=UuW3aVGHvSmoLdsenPApe4w9bZoy+GyYbfEpNZhZeVRYxU9Cm2J155U6QT8oPvj66p
         d0ZAxrIG8iAh3/AWPePVpRvYj0ruVPMSp5QKF0IyQ0yDPRaV+0rQ8vmeFTsvFmRbvfs7
         Fe0CuB/5vfA+MoqxoRzF1MMnDmgo5a4aCpsdwKwUiD6sa8USIplA9t2aePmX054JEF7z
         8rMS22PAsyOg+WELLqx1W6mEaDXMoj49xO3+quYktIAcklzHBLPfobMtP1EaIVciehEs
         0WVDBCFFmjofxf9DoxTGrQRg5FF22BGkBe0BfQUOzugziNcBvrEwfCEJASGlc2ViyZyv
         haoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9rEMmwDLlXmxCbmyNaBdtW6rBANiiUjWUTSN9vqyygM=;
        b=D1OwCDpSpAgUd2URbjCC8D6fYxdnBQ4wrhs2tW3CENiV0lt+ROFI3Jj7xl2JpCs4W5
         IjRNi49evactIkJiXzv5I/D3WNdnxgKH7C73JF0hYjFEA9cMom/usJJNJN2N7488swjs
         UlgZHVtLqiBC4x9fxVyHclt2O7aIYZ6hUeZQQRAb1GncEKqKaYfnmM0tfcx6RogyoMI8
         ljYlP0HZh0tEF1iTuiWPZSQVoJJd8BcHjZNSSMmZ7nAukCy9MuZxbdnhW+3t/R/NrRQ9
         fc2zjJKClUSeyf4hQ2JiNFTmqbyNYEl1CaCkUufC2pmTh7XNDu2UymaNYpIFGMnCq9OX
         2vWA==
X-Gm-Message-State: APjAAAWAgV/Q+xbJI4u+IgUWfaes7veaVh2nI4/2bQLhCqqsVyJ76zgo
        fyK1nZ4/LkYY9KDNP3sP2MPBvoOL
X-Google-Smtp-Source: APXvYqxQ6dzwIlERu//4stauubPJpXx9rPV4hfntBgGHnzx6ODTHt2Aa8DfySi1MzqGRHCYmlaNcZA==
X-Received: by 2002:a2e:9f44:: with SMTP id v4mr18363825ljk.72.1557258435025;
        Tue, 07 May 2019 12:47:15 -0700 (PDT)
Received: from [192.168.1.19] (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id w19sm3485217lfe.23.2019.05.07.12.47.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:47:14 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
 <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
 <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
 <c3a8be67-a3c3-60d3-aeed-4ef36f72f164@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0b23f5f2-5352-c281-62e2-8286584bc63c@gmail.com>
Date:   Tue, 7 May 2019 21:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c3a8be67-a3c3-60d3-aeed-4ef36f72f164@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/7/19 9:29 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/7/19 2:13 PM, Jacek Anaszewski wrote:
>> On 5/7/19 9:06 PM, Dan Murphy wrote:
>>> I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
>>> for the LM36274.
>>
>> Yes, I've seen it but it was quite late. Let it receive
>> fair testing.
>>
> 
> OK do you want me to combine both patchsets?  Or leave them separated?

If that one for LM36274 still applies cleanly there is no need
to resend.

> 
>>> I can post that as well and we can present everything for 5.3
>>>
>>> Maybe even the base MC FW ;)
>>
>> Is it somehow related?
>>
> 
> No

I presume there will be also another approach to MC FW (see [0]).
It would be indeed nice to conclude it somehow for 5.3.

[0] https://www.spinics.net/lists/linux-leds/msg12166.html

-- 
Best regards,
Jacek Anaszewski
