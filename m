Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682EC406FA2
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 18:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229466AbhIJQ3Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 12:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhIJQ3X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 12:29:23 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D89AC061574;
        Fri, 10 Sep 2021 09:28:12 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w144so3610728oie.13;
        Fri, 10 Sep 2021 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8G7cvQswihFWAazcGsIyLUOsBBl0E9MiiAh80yrTnGw=;
        b=KPU2Q4wSB9SzEp4o1d0Kw8OTn60RUAozaxLOAq60CTuCjrXULRuI/IAf5ZkF5xvYPJ
         QHBk7dWDPpOotULVBBiHAgKTHfCDaDi4KPXh1qw06pv2Zyp/BiEQ99RROXdeHcpk5/bh
         Tt4ZRYV60YkmsbiuI4ZQq9OzXssUB58HzpjlnNK0A9Nk6kpGPFVK9F6V6lcRbxmNElX+
         7mBW5K/pizRrpmmRsEg+iPCgvN3hTcptvmCdCz7TBPB301DZ0h42ArRK86zDaKmoec1g
         Ohr8mD7BrRMydZuCtbF8JNuXgZj1kLWTiqSF6EU33gvax0RVVpS3KMOmU7Z8V2wdiiFp
         Ho5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8G7cvQswihFWAazcGsIyLUOsBBl0E9MiiAh80yrTnGw=;
        b=1MADpFClL/xf20gq9RPtRmpwZ+5BSid4O4Kke5mpYF17DBOIQif6gS0b17hcSz2Urx
         KTeDyGGRq3n2iuXeLzD1JUILxi25QHMAAjKmHEkoJfZAWLr+UDamKjU63hs08r4qC+2+
         wX6FLKLutmWevRITWvyk1r5IuMSVCW5nz+0xO8p616rTDukpbMLdOeCykue0KsTENYH6
         FVbVhq77APFasSqkFJieieqSJlda1mtza7MCzQgcy2u5GnK9RrvdJ889oODBOoASgw0M
         FZVHBmlD+s5d3Ik5sB7bdvffNGxdFsmczZsMIciGULJW5CxxRSHlM05pNcKemqD5D5IL
         kyYQ==
X-Gm-Message-State: AOAM533PfK/OnXKgkfsdMFCwltPbEgxWF9YaMOOSsLv4QMuj8sryYizu
        NI4vda1LGrC/hfFXcPIpYRY=
X-Google-Smtp-Source: ABdhPJwKhmGH8Ry9crSHy946O1RDEza5R0WDpHrtJfwT8v3oho8sEzaemJ43fx3K+bzTzER7jj0YLA==
X-Received: by 2002:a05:6808:56a:: with SMTP id j10mr4892216oig.79.1631291291473;
        Fri, 10 Sep 2021 09:28:11 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id v19sm1331738oic.31.2021.09.10.09.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 09:28:11 -0700 (PDT)
Subject: Re: [PATCH v2 06/15] leds: trigger: blkdev: Add function to get
 gendisk by name
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-7-arequipeno@gmail.com> <YTr+8h12z7kMLlV/@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <4a69b13f-6f7e-98ba-7b9b-35bde571462e@gmail.com>
Date:   Fri, 10 Sep 2021 11:28:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTr+8h12z7kMLlV/@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/21 1:45 AM, Greg KH wrote:
> On Thu, Sep 09, 2021 at 05:25:04PM -0500, Ian Pilcher wrote:
>> +/* Must be built-in to access block_class */
>> +struct gendisk *ledtrig_blkdev_get_disk(const char *const name)
>> +{
>> +	struct device *dev;
>> +
>> +	dev = class_find_device(&block_class, NULL, name, blkdev_match_name);
>> +	if (dev == NULL)
>> +		return NULL;
> 
> You now have bumped the reference count on this structure.  Where do you
> decrement it when you are finished with it?

With context this time.  Sorry about that.


That happens when I "unlink" the block device from the LED in
blkdev_disk_unlink_locked() at ledtrig-blkdev.c:410.

(And also in the error path of link_device_store() at
ledtrig-blkdev.c:372.)

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
