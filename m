Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2019B1538B
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 20:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEFSTu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 14:19:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36743 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfEFSTu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 14:19:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id y10so3179085lfl.3;
        Mon, 06 May 2019 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8G8ndb9h4ZJX+UJoD1fO38tftAw2ymzbcdoUwjJjvJk=;
        b=TY0YX9/cmGWriP4/hG1VfwH1V5yenPgRAizrkKh3mfJ/H5JYX4F+JtlXUlub/2MBDk
         FU4OcMNy9WTm06KIzDt82BWUcesGXRhz9BP38rETJniI93vgxWuXjxh75phTLilBGLzt
         hB4Qq/C0SrrU9tXpanqsGc3tS6b3sgtLAw/Oy6zxVk0VsjfLl8O/ziQna7j0s5R9Sv1e
         TuLlJ2BS4GiJuct5CDvj4ieniv0g5oNMaAvNDI33MvXgDqp+SU+P0LDY59W6liMk/1+b
         5QLe0Wf1oJ7DnG9oAsDJHTHukSI66+xS+seSqFpAYd8Luey+X88JEBpK+ap8iGwMTLiL
         egcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8G8ndb9h4ZJX+UJoD1fO38tftAw2ymzbcdoUwjJjvJk=;
        b=raj4srlkaoaaRinoo0PMAdiNfUkdEyaDKQw2TV6SsjeMsAvOH9OXusOzO9+geK2IQt
         iuQZ0fgpGRXqaBcq4bVPJ8cMQRdPWxpK262Cw0CZ0PAgU3emTlIi/wBAKGx+HD1BNGJq
         Dve4a4GpQq6ZRkVj/glXtBODelz1OCE7p6cqkpKslGAWevookxpR6JR/7JemZciF8fuG
         UlWgYkAz5wWzhgDuZjf10w6ExRO3QQVLgJs8Vfru9ZerW4SorJaE6vmpz3v58uzrDz57
         SVVYcw91q9U6eD978unprQfCrzwXzafRHL4ovzE82FghKFSJlgYtMTf2h7V9HaV+zbzm
         a7Vg==
X-Gm-Message-State: APjAAAVd2hETZT22aBkNNJu2kwCCJlD3VrUTixt2hU/9mh7IGhKs80E9
        nEIeawIRN1qbMblkzpaI+jY=
X-Google-Smtp-Source: APXvYqzRuD+p0kVcszbb4/aQfzBQghmk1XSDu21F8p8SGCrQHxM0Ryxgik92+Ef/TM94c1WgJXTWSQ==
X-Received: by 2002:a05:6512:309:: with SMTP id t9mr13580342lfp.103.1557166788574;
        Mon, 06 May 2019 11:19:48 -0700 (PDT)
Received: from [192.168.1.19] (chs110.neoplus.adsl.tpnet.pl. [83.31.16.110])
        by smtp.gmail.com with ESMTPSA id p25sm2911981ljg.9.2019.05.06.11.19.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 11:19:47 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     oss@c-mauderer.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com> <20190505201218.GA21957@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1c318194-f57f-4807-5f94-8cca8e1c4b9e@gmail.com>
Date:   Mon, 6 May 2019 20:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505201218.GA21957@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/5/19 10:12 PM, Pavel Machek wrote:
> Hi!
> 
>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>> +	if (!led)
>>> +		return -ENOMEM;
>>> +
>>> +	led->spi = spi;
>>> +	strlcpy(led->name, name, sizeof(led->name));
>>> +	mutex_init(&led->mutex);
>>> +	led->off_value = off_value;
>>> +	led->max_value = max_value;
>>> +	led->ldev.name = led->name;
>>> +	led->ldev.brightness = LED_OFF;
>>
>> This line is redundant - already zeroed by kzalloc.
> 
> Actually I'd prefer to leave it in. Yes, LED_OFF == 0, and will
> probably stay == 0 in future, but...

but what? I don't really see a sufficient justification for
leaving it. Just redundant line. In other place in my LED naming
patch set you wondered if it wouldn't have been better to initialize
a struct partly using initialization list, I suspect to save few
LOC. So here you seem to be inconsistent :-)

-- 
Best regards,
Jacek Anaszewski
