Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BA02CDD6
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 19:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfE1Rot (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 May 2019 13:44:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43451 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfE1Rot (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 May 2019 13:44:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id z5so18530930lji.10;
        Tue, 28 May 2019 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vTNP3WJ8o78sxVeNIgMEXhpfs7BXqTtYopTEC44B8ak=;
        b=qMqdOG52OQW+ngYpp0JOZVGR966Sd/+p/f8O2IZ05WDqnd3XDow1WCmv2t7pAjvDKI
         XtN36OY1eBI9L1wimg4doI+H3E+K0ibYmitTPZPDcQi0DEZgiRqFcNK98J1PjL6NuaYb
         xxxNrYGfJT865QE43eomKy9dZvTaii/tJEtRFfgMEZCC7IYDb0c8otUvl24NAworuXrq
         S1JdoMWVn8NorzuFeZnjDUuLcVY17pp+PiupstGgdSofUZ1G5hIxrSJRcPtV+Pwbbo/+
         6epxwSYKUOwV8QOG+DtFaqA6sU+A98OCnAVXg9cBilg03z0bVHF2cl8+huXfdNZOmS/S
         Gc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vTNP3WJ8o78sxVeNIgMEXhpfs7BXqTtYopTEC44B8ak=;
        b=b5paq/g3HwH9ftCdJWzWvQkxvEc7vFE1HiOhG2W8vr0S1tr+Lajq8NFAZFZ6U09A6Y
         6rK9Jt6ykCoZf1ZmljqiuE9P7JEPP6Ius3h9ezEO1KbDIzBSQ68tZ/sPVHFDztUVVPaQ
         vNcPtYpX1Xs/rZ8wnJFyVBeEN3f1tdEZtkKpQmOemz+CAh+9YVG0DA1Hrt0pE331fMpF
         NKSkXLQUnEL69AefEDOgELMCEhLNdaaLsJDDqiPxPF4VF32rkd6rBpVh6O2vIXsTFCS8
         XN9z7I3tVIjjCIbir3IlYvbjEH6DyQ9ekATvXWmbGzWKkpHxv5cRby9c9//2ksDYqTd8
         8qaw==
X-Gm-Message-State: APjAAAX/QWGK6t5jm9cARi0c5VGbufhfN+ceLHStShNdE4vMf4SnxnfV
        /PnbFpfHqXkThRVCncx3ccwnEo3z
X-Google-Smtp-Source: APXvYqxQtQp0L0utIZAfGgofQxKTXH23puQ73wGwN4T/GGH4c4IHkzlgFe/BhnD3T9B62z9pFtD/ZQ==
X-Received: by 2002:a2e:6817:: with SMTP id c23mr43378392lja.145.1559065487084;
        Tue, 28 May 2019 10:44:47 -0700 (PDT)
Received: from [192.168.1.17] (cis152.neoplus.adsl.tpnet.pl. [83.31.42.152])
        by smtp.gmail.com with ESMTPSA id 20sm3032506ljw.7.2019.05.28.10.44.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 10:44:46 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
 <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
Date:   Tue, 28 May 2019 19:44:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 5/28/19 7:32 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/27/19 3:00 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the update.
>>
>> One thing is missing here - we need to document how legacy brightness
>> levels map to the sub-LED color levels, i.e. what you do in
>> multicolor_set_brightness().
> 
> 
> Ok so i will need to document the algorithm that is used to determine 
> the color LED brightness.

Right, and please send just an update of that single patch.

-- 
Best regards,
Jacek Anaszewski
