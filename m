Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E831819DE2F
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 20:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgDCSpY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 14:45:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56180 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgDCSpY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 14:45:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id r16so8160176wmg.5
        for <linux-leds@vger.kernel.org>; Fri, 03 Apr 2020 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QExk3QSOGqpV6pYBmEv/nvoilcaIaiazIYNSCGzuVvc=;
        b=HTeh5CrjRiNw1XkcseHWiEzVuOfas2DfiyY1WNonKdPmrB7zDZi3hqaOa9XKrh/n1N
         RqE0STCWGg/dY2421fxm8u/crTLH26T0iQeboDVw2nbpa8KlCMiKNFFz4cgPDXTvPGt2
         paMRz124Xh8TD0svEpkhhZ351JAT1zNYel6nmJ1f9oGByLmvRZ5TCyjRKXpgeSV2NwWE
         xyfsu4uHGewbbJfaTIsu1EjsVIvJwuR1gd6p/f+jtNUjlHAMlwqhr3w9U33NtpXSQB6X
         UfcxeHQpHgcS3EY0yiGs+gAKyxFs0xbMhxZfWjny9KPng35hfTiWipgw0GMe+1jSCOyb
         IpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QExk3QSOGqpV6pYBmEv/nvoilcaIaiazIYNSCGzuVvc=;
        b=ObK8JwUphxO2GBkXZa/o0AGoRjfM7TXLAut1ZG1yN6KCpO/fIrb3vRgVf+H3Pe44Y4
         x/rdRSYEDIi6T4ULL5DbNg9PnaPIk/30gEPCzOT9svBrwowaaA5r1OClYm5+RIwD9KZB
         0Pw4UxlBDKMoFXwZj5Nn3dLfnOG0aOGW1SKJHUrySnqokJAdlpZwnOobFaqcmOup6/9B
         O5PD5vERGeSY5p7PIIZkhII8H8vA7MnqzOj4J6xjKg4Ite/QCyX92UGr8vXjzon7hJDu
         AzxUVAbxzAJNVTudAyPE8iE+IXm450AP/o62SpkDEDgIRlkehRHHMq9cUY7I7YIow5CY
         qKtA==
X-Gm-Message-State: AGi0PubOUE5O6ou8RBRDWNqtvZgTDIAJNYp3QkPCT7QlU39Eox2pP3tm
        FszzUO31+5VJUkY1QAYGU8QYiCFf
X-Google-Smtp-Source: APiQypKrojYhO3bYD4YOtXFI+CNnEgfIzy3g47Sc/RMybvfCiOy22i1P+P8wkmmTLSe2wG7UEMMOJA==
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr9550045wmc.45.1585939518179;
        Fri, 03 Apr 2020 11:45:18 -0700 (PDT)
Received: from [192.168.1.23] (afga96.neoplus.adsl.tpnet.pl. [95.49.156.96])
        by smtp.gmail.com with ESMTPSA id v21sm11990870wmj.8.2020.04.03.11.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 11:45:17 -0700 (PDT)
Subject: Re: Cleanups in "next" tree
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com> <20200402225745.GA9830@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
Date:   Fri, 3 Apr 2020 20:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402225745.GA9830@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/3/20 12:57 AM, Pavel Machek wrote:
> On Sun 2020-03-22 14:35:56, Jacek Anaszewski wrote:
>> Hi Pavel,
>>
>> On 3/22/20 12:59 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>> I've commited some cleanups into LED tree ( git/pavel/linux-leds.git
>>> branch for-next ), if someone wants to review them.
>>
>> You abused your maintainer power by bypassing the usual patch
>> submission procedure. Please remove the patches from linux-next
>> and submit them officially for discussion. I would have some objections
>> to them.
> 
> I'm sorry I failed to meet your high expectations... But I don't
> believe I done anything completely outside of usual kernel procedures.

I believe code review is quite usual kernel procedure.

> Could you list the patches and objections you have?

I already expressed my concerns regarding Turris Omnia patch.

My comments regarding remaining patches:

- "Make label "white:power" to be consistent with"

I disagree here. "system" was OK.

- "Warn about old defines that probably should not be used."

Obsolete is only LED_FULL, so the comment is in wrong line

- "Group LED functions according to functionality, and add some"

You're adding here some random comments referencing obsolete
naming. I think that it is enough to say what is current standard.

Also, I had a patch [0] describing standard LED functions in my LED
naming patch set, but it was not merged. It could be worth getting
back to it at this occasion.


[0]
https://lore.kernel.org/linux-leds/20190609190803.14815-27-jacek.anaszewski@gmail.com/

-- 
Best regards,
Jacek Anaszewski
