Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8E10056
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfD3TcT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:32:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50895 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfD3TcS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:32:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id p21so5075397wmc.0;
        Tue, 30 Apr 2019 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VwcoE94rdoDgV1VfL7dXkP4guKkTeWDugiKCwb7SelE=;
        b=Y3vY57XsVL69Qz9vSUswirKwc6rPRSyTnWq8oR6ZqSHXBaYUVk6lhMS6T4XGMfVvRz
         YX8VZvOgwu2WE8OGl6iheOyQjYY4kwwp3SeBS+sLgd9NaRyfoMKbNcMszef2JjlYyc5y
         A9H0XPnfWSOlzjtWn2SwQVMcYn7PYJ1RcbX4emeLCN/3HSwHEJC0bsTUmbWr9y6wM/t0
         AXp4QhBmc0J+YoKtb0GJUsmuO8+4IWj06vl8BCy/yTDfp8CBwDVGaMUHEBE/FLOfVUX7
         fQdLV6XKUNnDUYq9HnjbgDfFVkQrn8n6KX+HGYsjJADRtku7ebWiWBMJ9eBnO7NUTcwc
         1FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VwcoE94rdoDgV1VfL7dXkP4guKkTeWDugiKCwb7SelE=;
        b=fYoKY/FY2RRLpPmxjC7WC8cAYrOmZdbwwdYUr7uNKNbdv2mqRBhIxB0BDuYumIQYAn
         /9mNDHR5tVs1OP47THugxXk4L3O+BbROT1I/JehP3F0LHu4I9DiTkhEFNkph5V2Syomg
         +LwrTjXYOXdhgTkS+6f5KNJqqTvhnZ9QR8cjvNUXc7qQHGqsVDKDdS4ggBhFlKsI6cBF
         K54WdF+JDKegoxUTdbPKlKcDDn7sf9MGu/R364NTu/n6tk2Y5byfZ1RVkdtn4glwp8Y8
         68UfdA6YcqwPlyvGSM7DNF7716+nxFo3Q5sL90bLyGtdqDZ18VEEVWUhPWQfgf6zsn0P
         2CdA==
X-Gm-Message-State: APjAAAUuD0aGb0UvEMVQrm8URMhmm6IX+XuiYPz28Fnqrdwax8ErxYe5
        CS415NQ/wnb6QS3ANf68diehENMt
X-Google-Smtp-Source: APXvYqyne/P6d+tX6M5/o+xILX7VOrBUPVOftY9uaprYqCuCNHOBpYfgE0vScxuxshbef5cUd+zBFA==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr4238197wmt.33.1556652736795;
        Tue, 30 Apr 2019 12:32:16 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id x20sm19191261wrg.29.2019.04.30.12.32.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 12:32:16 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
To:     Dan Murphy <dmurphy@ti.com>, Randy Dunlap <rdunlap@infradead.org>,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
 <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
 <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <98b7f0fd-6f94-b8a1-a367-77d8cae2a97e@gmail.com>
Date:   Tue, 30 Apr 2019 21:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/30/19 9:30 PM, Dan Murphy wrote:
> Randy
> 
> On 4/30/19 2:23 PM, Randy Dunlap wrote:
>> On 4/30/19 12:17 PM, Dan Murphy wrote:
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index da00b9ed5a5c..3ae24eaf4cde 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>>>   	  To compile this driver as a module, choose M here: the module
>>>   	  will be called leds-nic78bx.
>>>   
>>> +config LEDS_TI_LMU_COMMON
>>> +	tristate "LED driver for TI LMU"
>>
>> what does LMU mean?
> 
> Lighting management unit it is defined in the DT documentation
> 
>>
>>> +	depends on REGMAP
>>> +	help
>>> +          Say Y to enable the LED driver for TI LMU devices.
>>> +          This supports common features between the TI LM3532, LM3631, LM3632,
>>> +	  LM3633, LM3695 and LM3697.
>>
>> Fix help indentation above to use tab + 2 spaces consistently.
>>
> 
> UGH I wish I had this comment 2 weeks ago.
> But I can fix it

I will amend this while merging, no need to resend.

-- 
Best regards,
Jacek Anaszewski
