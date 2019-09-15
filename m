Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415B5B2FF5
	for <lists+linux-leds@lfdr.de>; Sun, 15 Sep 2019 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfIOMpv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Sep 2019 08:45:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32935 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfIOMpv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Sep 2019 08:45:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so5278714wme.0;
        Sun, 15 Sep 2019 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sPQgipNi6zYqj+O0PF+Zu66miidWkOJBO3jpaxxld/g=;
        b=Bq/SHN25f9dZEUzfK24KDrkvU8HMMZJpc6UR+OvVoO1XpvS4spDz0r7dW5LeDSEfHD
         rCpqvd2ri2yj+JJ0ssRPzKu4081DuXq6NK/BfPhM4RIgZOcmSVBJL27HAOnqoqwbsLmV
         2VYW7wP6PPsJWGR56SpGYtOwnE8MjpiEcNgXvreUUEG2/sV+Ji15sURmchlCdJ6TQL+b
         35KzvmFdArSht4xTSFohhCwgpuemGRR7gCL0Xxdw4D9r8OPw65elT9s4hFwRJudO+n1j
         SoRMklCKXlSJ8++F64QAwgiXcEhlaEaTnOhRwbyo7vfXKVqo9VbrmwYbY5Wmh2K5VUXC
         ZBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=sPQgipNi6zYqj+O0PF+Zu66miidWkOJBO3jpaxxld/g=;
        b=QaVMsWJO+LINAzulZQm8+YVRG/CndcjWfvwS8HJXO6SDd4uuOA7woNdqz9DUDNnUdG
         hmBmLKRSkg8oeTXz9eKJ/4ndls+8Q3akplkkyahz+t50ewLJBU2H4HZynFFbfVIeL3kA
         /N1a3AGY/NTghoqBv8cBosQFswzlHx3BXTC5+t2N6Qnn7nCli6YTNJYXoEy0R8gYcDTA
         VUSKFZMLK5KRdf8rGCw6MA0XQKJvSQOsxJ1FoVvUpowTxLKpwBtDf5pYGOvIWeufI4gS
         x3F5OTNwiuvsX3m4JQu6HgEWbGS28iU1HIOhvME5JZVEk6R8+zpG9bdogHxXrkaCUiOZ
         EThg==
X-Gm-Message-State: APjAAAWVdT+khCg0IB0F/yldQi29B3zO/Ms41OFHclotJS7t8ue23IeZ
        QVWRmmj+0jawEFeB5Pj8OgjHEtH4
X-Google-Smtp-Source: APXvYqxl4CalrXQ2TsIfOC1kUfinWGaGLzkiNoxCac8v7xnwNdmKbDrSeTa+QtQuWvFSjZ9wP+8mbQ==
X-Received: by 2002:a05:600c:54f:: with SMTP id k15mr10127812wmc.21.1568551548015;
        Sun, 15 Sep 2019 05:45:48 -0700 (PDT)
Received: from [192.168.1.19] (ckk130.neoplus.adsl.tpnet.pl. [83.31.86.130])
        by smtp.gmail.com with ESMTPSA id i1sm2529175wmb.19.2019.09.15.05.45.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2019 05:45:47 -0700 (PDT)
Subject: Re: [PATCH v5 2/9] documention: leds: Add multicolor class
 documentation
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-3-dmurphy@ti.com> <20190912205551.GA13514@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f9d9f299-f9fc-cac0-eaa4-f080f435a856@gmail.com>
Date:   Sun, 15 Sep 2019 14:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912205551.GA13514@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/12/19 10:55 PM, Pavel Machek wrote:
> Hi!
> 
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
>> +colors/:
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 green
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 red
>> +-rw-------    1 root     root          4096 Jun 28 20:21 color_mix
>> +
>> +colors/blue:
>> +-rw-------    1 root     root          4096 Jun 28 20:21 intensity
>> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
>> +-r--------    1 root     root          4096 Jun 28 20:21 color_id
> 
> I don't really like the directories... A bit too much complexity, and
> it will have a memory footprint, too.

We will need separate intensity files for each color anyway so separate
max_brightness can go along in the sub-dir - it will be cleaner this
way and will leave some flexibility regarding max intensity supported
by the LED.

And I'm saying about the need for separate intensity files because
I've changed my mind regarding color_mix file, basing on the recent
experience with trigger file PAGE_SIZE limit rework. That said, I am
no longer eager to accept any exception for one-value-per-file rule.

This of course render color_mix file format unacceptable. In a new
approach intensity files will only cache the values and actual write
to registers will occur on write to the brightness file.

> I'd expect max_intensity to be same for all the leds in
> rgb:grouped_leds... Could we simply rely on max_brightness file?
This may not be necessarily true if one will add gpio LED
to the cluster of PWM LEDs.

> [If not, would one "max_intensity" file in rgb:grouped_leds be
> enough?]
> 
> Best regards,
> 							Pavel
> 							
> 

-- 
Best regards,
Jacek Anaszewski
