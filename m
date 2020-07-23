Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3D522B746
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgGWUMA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgGWUMA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:12:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABACC0619DC
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:12:00 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n22so7713292ejy.3
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1umQ+nGHcYta8U7ZiDqNxmim0ys5Wq8Di27iNABWPRk=;
        b=BDiZdOeWl2vLZFl9rZhQ1V2YfQH5/hEbujvOp2oFl9/svkyBB4O6GiyB9mB+6OGYhT
         qLeknrzjnGoOSpZcZCaFPf9eAdWuT4urZHUkio/E+xjddlxGvpCHyf9zRs+i9svV/ki7
         Ukz6bF0L4PDRstm291ctX76t8YOMEpob2PLdaHPvwF6EmY9t/nvpFoelXkiLMlC4bJb+
         Dh8PY9biyA6zN+I26QvTW3H5VUCLMWxvrNckECf8SoXsI9/j3664XT/97YoLjNCLOlKU
         v9us7FqzsZchyqpn0V0175BT0jb1vLiiFIRgzZxQSk9q52kVyzzpqRVZbfl9O7ywNQyX
         1m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1umQ+nGHcYta8U7ZiDqNxmim0ys5Wq8Di27iNABWPRk=;
        b=ckNoJAs4nU/e2ndirEK1QfLnvef7OBVl+2APfeK7frTPeKFPjYgGs4FxSuavHPinKl
         4ULysmXiBARgmww6hXUMc3D5nkbAULOo4Sl2gVrIJzeYN7A9/0lNTJqLEsB+Is0nC+7z
         NXcJjMjTLYpDzhoIW4FkxT6WTulYBhNmchZbhgOPka5YsNRRw5/IU9MtG12AesKAp66U
         G7J4eEptT+I4hLUxIvBFKjRSlhXsXnyXsVfTYPx1NP32GEc6bDIIEUDhvjA38tGnnP6V
         POKjQjh7V7rn0/KH1h0zFQU+HGmn2glBvEsAaxh7Z4MIBD+LNM4ICzGV4I+LZYDCbdIb
         tleA==
X-Gm-Message-State: AOAM533gDdXceQw9ofqg68vI4KCQXp482+Iz7uXLCWTRbBtyLhfT2U9w
        629so/YjE7zCFdlDlEUW9RT81aH6
X-Google-Smtp-Source: ABdhPJxuV4W67inIpHv/c7eMaiPbCvJeb5sAHhezuZrh9YxhydPoeBFwswG/s9Pqdd+Cr+ALvNUdYg==
X-Received: by 2002:a17:906:1357:: with SMTP id x23mr6411229ejb.148.1595535117490;
        Thu, 23 Jul 2020 13:11:57 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a882:7627:8b01:53ad? ([2a01:110f:b59:fd00:a882:7627:8b01:53ad])
        by smtp.gmail.com with ESMTPSA id lc18sm2088847ejb.29.2020.07.23.13.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 13:11:56 -0700 (PDT)
Subject: Re: [PATCH] leds: add orange color
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd> <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
Message-ID: <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
Date:   Thu, 23 Jul 2020 22:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/23/20 10:09 PM, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 7/23/20 9:39 PM, Pavel Machek wrote:
>> Hi!
>>
>>> Many network devices have LEDs with green and orange color, instead of
>>> green and yellow.
>>
>> Is it likely that we see device having both yellow and orange LEDs?
> 
> Why should we?

This question actually refers to the below sentence...

>> I'd simply lie and say those LEDs are yellow...

So, why do you think we should strive to limit the number
of color definitions?

>> Because... there are lots of LED colours available, including pink,
>> various shades of blue, ...
>>
>> https://www.gme.cz/led-5mm-pink-3800-60-504brc2z-p2f
> 
> I see also "oranžová" there :-)
> 
> And see below:
> 
> https://www.pcboard.ca/5mm-super-bright-orange.html
> 
> I've found also other examples.
> 

-- 
Best regards,
Jacek Anaszewski
