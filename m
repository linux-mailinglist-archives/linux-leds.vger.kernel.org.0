Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF55406DFA
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 17:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbhIJPKW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 11:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234141AbhIJPKW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 11:10:22 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D45C061574;
        Fri, 10 Sep 2021 08:09:11 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w19so3294849oik.10;
        Fri, 10 Sep 2021 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hL1zCwUiJ6hoIGlHwhgGP4f+imH+ev7xCevX0zajur0=;
        b=aJWH063vakKMa/mWbAQvIPrxcWojIL00+4tEJylPGRzokbZNmQvDYbby+E+63mi8Si
         3rvZFYky++YjRWuzixJNhA3WuTh/ette7OK6GE9NRJ01uZiZKYz60ijCfJrPEOa/PlyM
         8aXL8IUdctEvfsJOUBPZzYBscnKWesO+dPTAQvFs36Ab0403Qap0ZIWAjmSPZ6u/kQQh
         etGaHNzZaePtMjemDrzfkCd8Unzy/NM7t/ful/GCVwqTsB1yxqyOiLsSD/HKwMkkRB8F
         73XN5RPWSIyp4IVXEBI6aXl8sBohpTg5GzPDF7vRevuU0yCmjz01NwNn19vasRWo7pPZ
         qFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hL1zCwUiJ6hoIGlHwhgGP4f+imH+ev7xCevX0zajur0=;
        b=R0xFBFNYFN0R8USXbvba9il66sXDftNuHp/w/0TpV27aO0Of29gki/Dc1/h1bnNzu8
         1lJGAycwNtOxikWkradE1IS9uBxNyH9xLAR2UUskJbZVAfRz8COPhpbwF8c7cPG1erK8
         GI0YhDuE/3r2edEvIeVUMIBuG06Co7hHR0E83fPxqKS5tYgwD5bFOWFdmdYvSgOwRKrz
         gd5MKXoDnWCHLGXeNgqpEspm9N9tm/g52EjJ5PqxMMgWzPiMcoL6N6d+povS34us4jgN
         lMobld6wkpz4X6kE7sDPaJUAuj8jpx0/VLbok2vbPnXHb+/73X4p63BIinXHmFgntdqN
         SnhQ==
X-Gm-Message-State: AOAM532/dELsj0WXtvtqvwZ23/0ATXsNhxIZFSoWsHqssWEpqIF16KGu
        4asmHG0LP0IJJ1bnsTT3p6A=
X-Google-Smtp-Source: ABdhPJzvBmE+4S7BdRw082cXwBi53czb+PLL/ElPThwO/9okMEjivrPpTvLPARkX7Aq8ZIS78njrSg==
X-Received: by 2002:aca:5344:: with SMTP id h65mr4587386oib.117.1631286550365;
        Fri, 10 Sep 2021 08:09:10 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w23sm1327423oih.4.2021.09.10.08.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 08:09:10 -0700 (PDT)
Subject: Re: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for
 activity and blink LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-10-arequipeno@gmail.com>
 <20210910041713.4722760a@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <77111c57-dfb5-44c6-c4e9-e18afb468b6e@gmail.com>
Date:   Fri, 10 Sep 2021 10:09:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910041713.4722760a@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/9/21 9:17 PM, Marek Behún wrote:
> So your code allows me to use a partition block device (like sda2) to
> register with the blkdev LED trigger, but when I do this, the code will
> disregard that I just want the LED to blink on activity on that one
> partition. Instead you will blink for whole sda, since you are looking
> at stats of only part0.
> 
> Am I right?

You can't add partitions, only whole devices.

# echo vda2 > link_device
-bash: echo: write error: No such device

static int blkdev_match_name(struct device *const dev, const void *const 
name)
{
	return dev->type == &disk_type
			&& sysfs_streq(dev_to_disk(dev)->disk_name, name);
}

Partitions fail the dev->type == &disk_type check.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
