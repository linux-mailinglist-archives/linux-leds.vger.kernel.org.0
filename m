Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7311EA107
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 11:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgFAJeK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 05:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgFAJeK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 05:34:10 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460DDC061A0E;
        Mon,  1 Jun 2020 02:34:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id f7so8582106ejq.6;
        Mon, 01 Jun 2020 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ujsvq7E0O1OJ/Q85N67F4xNheFg+8Sx1kiYhCQ9HsVo=;
        b=nSwTMy4SrY7wky5FfELiDtYErYOPgUr2xRemJJWJhNbKC7GW3FtLrW/XE3/kvNhzDI
         XYG69ZxBinSnVQNm4iRInnO1pF8KFyXfNmKm3AW2vHymd6lQ9nUY1lMGVfg0uldh+eUc
         rlZnLx8YhVAB6pUnNZ03DWMOXsgJgkFz67NgGAoiw6jWnYeGWAob5xg+fkuQ9qI27Lo7
         rB2+uFAtClTJHYrD/kpmXl6rxHPF4tB+TThz5epixStCqpeV/Yu9gyO6/d1l10x972zG
         y+Dif+oQhoX8PKCSf1smS9NtQyKuh20gVhXWx7Bvw5Rzd4FQsfSdLnJm0YC8pmDFL/xm
         FmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ujsvq7E0O1OJ/Q85N67F4xNheFg+8Sx1kiYhCQ9HsVo=;
        b=CugKlOYdNwwlO+4Q2IuXfb2aCRzDvTKhSuQNAzoItuUeI+a7fTOMSCKesl8uxfU/EG
         HCql3cE2xqipRKdg1C1C7Lxu6x9soSTC7oEaAUwcfDDV3Lvm3x7i1C16FoBaEB1ucLJL
         SOD81SbUqkDispXpUI4aNNbkU+V+jJ/qnRN+A7NHb7a630lZRncjlE/DmxtYFNcO1wuF
         bwYwr1qw2G/bmhNAT07f10T5Vos6API9kMISZPvvu0j/YLCbkjkF5NGYxHT5w3hsuC09
         rNf966Te+k/qW0tVpnJ2o9jui7CE12V+005IaRNZKjQD3cYx2CqZvW9YhFb2KPX49+C2
         0J/g==
X-Gm-Message-State: AOAM531iNRNrZN8xAury9RHpTDJoV4A4Paxe6n9ZN/S3pn5mSh24ANEt
        ATbjAwHQ3t8nWcG8G/TeO1szzTYH
X-Google-Smtp-Source: ABdhPJz93uMzHny/Glz01ho12bEwz9RwwtfyB+vQM8PCiCUQNX52iD8PyYGc9zPB5stnxxxoKiCwpQ==
X-Received: by 2002:a17:906:c828:: with SMTP id dd8mr19530044ejb.550.1591004048801;
        Mon, 01 Jun 2020 02:34:08 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:fc8d:d1:9ec:ca37? ([2a01:110f:b59:fd00:fc8d:d1:9ec:ca37])
        by smtp.gmail.com with ESMTPSA id l60sm16311462ede.32.2020.06.01.02.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 02:34:08 -0700 (PDT)
Subject: Re: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-4-dmurphy@ti.com> <20200527135848.GB5011@amd>
 <d22658c2-07e2-74e6-dc2b-4b64fd9789dd@ti.com>
 <20200531190625.GA30537@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c03ce8da-0895-2e1f-0a4c-2b3d9fae8d4d@gmail.com>
Date:   Mon, 1 Jun 2020 11:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200531190625.GA30537@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel and Dan,

On 5/31/20 9:06 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +          There can only be one instance of the ti,led-bank
>>>> +          property for each device node.  This is a required node is the LED
>>>> +          modules are to be backed.
>>> I don't understand the second sentence. Pretty sure it is not valid
>>> english.
>>
>>
>> If I make these changes is this still viable for 5.8 or would you then go
>> into 5.9?
> 
> It really depends if we get -rc8 or not, and if you'll need to do any
> changes to C code or not...

I think that we need to simmer such a big extension of the LED
subsystem for a whole cycle in linux-next, especially taking into
account addition of new sysfs interface, that is bit quirky.

Effectively 5.8 seems to not have been viable since few weeks.

-- 
Best regards,
Jacek Anaszewski
