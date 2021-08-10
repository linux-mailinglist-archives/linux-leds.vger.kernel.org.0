Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC433E7CE8
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhHJPz6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 11:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243081AbhHJPz6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 11:55:58 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1310C0613C1;
        Tue, 10 Aug 2021 08:55:35 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t128so29476603oig.1;
        Tue, 10 Aug 2021 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QFMIGRol7sV7/3Q+36hwNIwNbBlX+rl3ShevG/F9H84=;
        b=rp8AUGfNdqWi0MkQHN2MpjPflMt1qnkgOles5T9lsTu7PsejD7ghbNg/xG2w7Um8ic
         HqDOUHBqhfjr05ZiDYbFo69NLpW2ip3OIty+nU6mQeBeflrtuXZ4nuZyXolyVo8hf8tQ
         VYuw5Cnok2i7GNLSj9IOLFeVnn2n8L2s8pwEdgTlLg9e/S5Eox4i2jkO0JHujtYqe2ac
         powEHKt9TuT/OGAhuE+2qNylfFfU6KvjEAs5yESnh4dMZy7RI3Cdsz0IpiE8DQShnkpG
         ZghZw4AotRKgfAlTG3HnFWnDhjmJN1WrV25sr6HQSevI0xfTTsdLZV0iF8k5zy+MEMJ2
         XAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QFMIGRol7sV7/3Q+36hwNIwNbBlX+rl3ShevG/F9H84=;
        b=EKVP5ZHLbiylelQNoMz0oDsqzGrp44b3w6sJDM4exFjwouEOjsKScSzhBO2hJGgTsy
         ZLId5jwYOEpzRqkYB0lusxwkYVhwTGhwOegE4qckJHDDIWCCr//2Y0pJiwxu+pfPHoi4
         ybtjGZHyxu82ku9fVxuifqOukjorDjDXD9Yt8KHRqadrBmc+viAjbW5hSt8d3qcC5s83
         cEnAGoLRfCkbITZ95FbrN5GUHUDggpV08dKmxyB9udi7kGbkGkKX+87CNXa2/wIwpPrU
         lI0kGfKG6df2TNKArjBBgXs+BoAUe8sO+gt5rrPg0tGZZa3Yi3ZclFvSoPS3dsBhEqHv
         GWXA==
X-Gm-Message-State: AOAM530mWpk3CLr78qw5C6B2BDQdWs9Wl88RdTiPVrR4pDHsMvyAH+VQ
        3tsPRiVfc322aWMYCnQqmLfpp+ZEA97dyx4q
X-Google-Smtp-Source: ABdhPJx6smfXN4O6AiJlejH1VKquAjyv2G6aPsIEbcXSsBtTEV0j7ICxNxqDh5mOE6ao2lMrfIN9DA==
X-Received: by 2002:aca:f089:: with SMTP id o131mr20450847oih.37.1628610935163;
        Tue, 10 Aug 2021 08:55:35 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r5sm3214794otk.71.2021.08.10.08.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 08:55:34 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
To:     Greg KH <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     axboe@kernel.dk, kernelnewbies@kernelnewbies.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        pavel@ucw.cz, pali@kernel.org, hch@lst.de,
        linux-leds@vger.kernel.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
 <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
 <20210810004331.0f0094a5@thinkpad>
 <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com> <YRIeHH1SLl6tYCeY@kroah.com>
 <20210810153840.42419d06@thinkpad> <YRKRpQdLRJmAb5kZ@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <b8e99efb-7385-0ca2-641c-f93006b20527@gmail.com>
Date:   Tue, 10 Aug 2021 10:55:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRKRpQdLRJmAb5kZ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/10/21 9:48 AM, Greg KH wrote:
> But what about when the device is removed from the system first?  Be
> careful about that...
> 
> Anyway, sure, try those functions, I really do not know, all I
> originally complained about was those exports which did not need to be
> exported.

Sounds good.  I'll work something up.  (I'm actually thinking that
class_find_device() may be the best way to go, as it grabs a reference
to the device.)

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
