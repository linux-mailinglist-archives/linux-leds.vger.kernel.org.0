Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C842122B73B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgGWUJF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGWUJF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:09:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9399C0619DC
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:09:04 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id p14so5687291wmg.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uqcvwZoxl5WbGFI1UgPN1tx2oMAR/8RfKc38mql0yFg=;
        b=Fv9UK2acIs3M8lZRRit2d6vN4+VldbCI3mJOM7SUj9kUDVs2E1XYJChCgyn4riDah8
         tP1P65qyF5rdgNNWDbkj5gcS63DhIYOYsHo+0oExFhTZ8VA6O0qKIYyjLWHQHmq02LzM
         L3dLNu7jH9I05A0AbSmibj8vGjjojS8AMeQr//Gd197epfOKdseZ8FG6uddh58t5nFO4
         yL/Mvpe1coOG8OzZjrWtbZQJjjMdF4VksWWOm92LeH6PlBF8FznwAOBT98inQE35+KEL
         2ke37AF13rvte5fRLKKlTJYNcg2K+mm+UtYYkvXVl0xFrlEkmXwYk1bHNO3dI7nLqd/M
         YH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uqcvwZoxl5WbGFI1UgPN1tx2oMAR/8RfKc38mql0yFg=;
        b=atKOeoJK59ITh+xlMzTnfBws0+0bjQKvj/ajuGPgnbUwvgaoJ+Nt/+fUXEkNkeLfyu
         DzAAXWh0Cgw8DPjnMJrl7qpJVG4m4PFMSeLKcvDjR70gJEdY+Yc63IWylD9yYD5kUxMo
         T7/2SIv87YCPKaH66ndM3761ItjGegK2vBGR7rwQ/d+G2N2W6o8uIoOjgSYRz88tvV2Z
         eE1Pd7iFYYBQxlpYBPE3n2hSOG4Bw8Jfl65XBf0YIer8lS4ky2LFqWpfh9Zb6ZHYrfvV
         6LxPHN7kroPPSfseQLRo80e8TyRnneLkpaHxR+l/oqCt+fTQ9IqtLr3kQD6rQ3yDUxOZ
         CBfQ==
X-Gm-Message-State: AOAM533ucp/4fXHHOq/Q8Aab7DXnDgurmaBIa+rC244toaTTqks5+Coi
        Dg4KL4TyrEvSljjWbb3cqp4=
X-Google-Smtp-Source: ABdhPJxjKnMRCp2dJdyzF2R8yvzGAwR3BjD7RtfdNJQwnCvagNvPSo1mfQi11j5OL1pp9dxIk7FS0g==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr3747689wmj.22.1595534943680;
        Thu, 23 Jul 2020 13:09:03 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a882:7627:8b01:53ad? ([2a01:110f:b59:fd00:a882:7627:8b01:53ad])
        by smtp.gmail.com with ESMTPSA id 65sm5643814wre.6.2020.07.23.13.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 13:09:03 -0700 (PDT)
Subject: Re: [PATCH] leds: add orange color
To:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
Date:   Thu, 23 Jul 2020 22:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723193908.GA26165@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 7/23/20 9:39 PM, Pavel Machek wrote:
> Hi!
> 
>> Many network devices have LEDs with green and orange color, instead of
>> green and yellow.
> 
> Is it likely that we see device having both yellow and orange LEDs?

Why should we?

> I'd simply lie and say those LEDs are yellow...
> 
> Because... there are lots of LED colours available, including pink,
> various shades of blue, ...
> 
> https://www.gme.cz/led-5mm-pink-3800-60-504brc2z-p2f

I see also "oranžová" there :-)

And see below:

https://www.pcboard.ca/5mm-super-bright-orange.html

I've found also other examples.

-- 
Best regards,
Jacek Anaszewski
