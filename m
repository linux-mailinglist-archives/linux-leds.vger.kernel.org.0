Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA52400D59
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 00:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234106AbhIDWgd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 18:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhIDWgc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Sep 2021 18:36:32 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C447FC061575;
        Sat,  4 Sep 2021 15:35:30 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i3-20020a056830210300b0051af5666070so3682050otc.4;
        Sat, 04 Sep 2021 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wfxpKWiQ70U6iKQ+edI35IYQos0MGLnTbkUjHDUL/o8=;
        b=l4J/dFKFciw6W9Kc9RFPvWZvaFu58aIA9mJEaDxXJs5XK11gHDLSJkGCUSTw1Yudo5
         55Ky/mlzqYsH9mG6rB3K40P3QNsRbQ0XdzmHXt4+wyGYOTNayFq13t3QMPAdhzR/oNtf
         JHuMmztIA8CwQyIh6ltIEWo47prz1YoGSAox0FImEVWqiUoH0mViyI4UoteOKJTO12L0
         0dI3cQIjXZc2aG0VmOGbW0lWWt7RSbqqRhsJnkzYSAo12s2U8A0XDIWYp798plz3mTIV
         Yf5FVXX4TKFuW/9i4GQrsGPix14IEfvvHq98cB5LGDr/uV26bBU+E/6ZofEYmRs59qIX
         Tr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wfxpKWiQ70U6iKQ+edI35IYQos0MGLnTbkUjHDUL/o8=;
        b=E0fzQmikHAGONpv9VayxnRN52v3mhWRZ3eU2MBGTlUvYkMAuUXiuy9qhfsFqkjX7QV
         b5Ff2B74SuuEB69IUvxhqqy2PPGD/CdoEiLIsal0zdk/5mnNr4P0B7cc2A+gZEawi1YB
         tpjRUPphOePIOjqjs7JlBgRmf/lwJYcaBVxuIjn0g1auiF2BILSVtKqBR+gzQDV25Gm4
         VWp+hxxxMSaK5eONYscya1FJTf/wHiSMvyZ05n48DVd/kFGoe7B+MgcX46kGMgTwLxjP
         oRvysIEjHawu9KjyOmua19JxpxVn3tDm+r24MQadVy/OFxIjE4nA0NkBLZkGPmXWldkh
         I7nw==
X-Gm-Message-State: AOAM53119UN1k0PeHbL3VEFrwQzmnLcVH9IwrvzggAKFeLDFxWFnmJrE
        w0X3SDj44Sh8b7vTo55+vRg=
X-Google-Smtp-Source: ABdhPJxoaADLVbylHqVZoc8i4ILKtSWfllVuKDIgHZ+uI6O8m5pdIcAh/Gn27jY0PQpR3qK65hGN9w==
X-Received: by 2002:a9d:2037:: with SMTP id n52mr4861050ota.361.1630794930004;
        Sat, 04 Sep 2021 15:35:30 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id l3sm780434otd.79.2021.09.04.15.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 15:35:29 -0700 (PDT)
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com> <YTMLVrCokErmYxEU@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <2791db8c-9049-adbe-604e-ff010aef03fa@gmail.com>
Date:   Sat, 4 Sep 2021 17:35:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTMLVrCokErmYxEU@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 12:59 AM, Greg KH wrote:
> DEVICE_ATTR_RO()?  Or something like that?  Do not use __ATTR() for
> device attributes if at all possible, worst case, use DEVICE_ATTR()
> here.

For some reason, it didn't click until now that these are device
attributes (because I was focused on the fact that I was working on the
LED trigger).

DEVICE_ATTR*() it is.

> And the mode settings are odd, are you sure you want that?

Yes.  These are write-only attributes.

>> +	if (name_len == 0) {
>> +		pr_info("blkdev LED: empty block device name\n");
> 
> Looks like debugging code, please remove.

It's really more of an error message for the system administrator.  So
as with my earlier note, dev_info() would be my preference.

> And how can this ever happen?

The blkdev_skip_space() and blkdev_find_space() calls effectively find
the first non-whitespace token in the buffer (disk_name) and its length
(name_len).  If the buffer only contains whitespace (e.g. echo > $ATTR),
then name_len will be 0.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (attr == &ledtrig_blkdev_attr_del) {
>> +		blkdev_disk_delete(led, disk_name, name_len);
>> +	} else {	/* attr == &ledtrig_blkdev_attr_add */
>> +		ret = blkdev_disk_add(led, disk_name, name_len);
> 
> Why do you have a single attribute callback that does two totally
> different things?  Just have 2 different callback functions please, it
> makes things much easier to review and maintain over time.

Hmmm.  All of the "real work" is done in blkdev_disk_delete() and
blkdev_disk_add().  The store function's only purpose is to parse the
token(s) from the buffer, and that logic is exactly the same for the
two different attributes.

So it's a choice between:

> static ssize_t blkdev_add_or_del(struct device *const dev,
> 				 struct device_attribute *const attr,
> 				 const char *const buf, const size_t count)
> {
> 	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
> 	const char *const disk_name = blkdev_skip_space(buf);
> 	const char *const endp = blkdev_find_space(disk_name);
> 	const ptrdiff_t name_len = endp - disk_name;	/* always >= 0 */
> 	int ret;
> 
> 	if (name_len == 0) {
> 		pr_info("blkdev LED: empty block device name\n");
> 		return -EINVAL;
> 	}
> 
> 	if (attr == &ledtrig_blkdev_attr_del) {
> 		blkdev_disk_delete(led, disk_name, name_len);
> 	} else {	/* attr == &ledtrig_blkdev_attr_add */
> 		ret = blkdev_disk_add(led, disk_name, name_len);
> 		if (ret != 0)
> 			return ret;
> 	}
> 
> 	/*
> 	 * Consume everything up to the next non-whitespace token (or the end
> 	 * of the input).  Avoids "empty block device name" error if there is
> 	 * whitespace (such as a newline) after the last token.
> 	 */
> 	return blkdev_skip_space(endp) - buf;
> }

Or:

> static ssize_t blkdev_add(struct device *const dev,
> 			  struct device_attribute *const attr,
> 			  const char *const buf, const size_t count)
> {
> 	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
> 	const char *const disk_name = blkdev_skip_space(buf);
> 	const char *const endp = blkdev_find_space(disk_name);
> 	const ptrdiff_t name_len = endp - disk_name;	/* always >= 0 */
> 	int ret;
> 
> 	if (name_len == 0) {
> 		pr_info("blkdev LED: empty block device name\n");
> 		return -EINVAL;
> 	}
> 
> 	ret = blkdev_disk_add(led, disk_name, name_len);
> 	if (ret != 0)
> 		return ret;
> 
> 	/*
> 	 * Consume everything up to the next non-whitespace token (or the end
> 	 * of the input).  Avoids "empty block device name" error if there is
> 	 * whitespace (such as a newline) after the last token.
> 	 */
> 	return blkdev_skip_space(endp) - buf;
> }
> 
> 
> static ssize_t blkdev_del(struct device *const dev,
> 			  struct device_attribute *const attr,
> 			  const char *const buf, const size_t count)
> {
> 	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
> 	const char *const disk_name = blkdev_skip_space(buf);
> 	const char *const endp = blkdev_find_space(disk_name);
> 	const ptrdiff_t name_len = endp - disk_name;	/* always >= 0 */
> 	int ret;
> 
> 	if (name_len == 0) {
> 		pr_info("blkdev LED: empty block device name\n");
> 		return -EINVAL;
> 	}
> 
> 	blkdev_disk_delete(led, disk_name, name_len);
> 
> 	/* See comment in blkdev_add() */
> 	return blkdev_skip_space(endp) - buf;
> }

Maybe the right thing to do is to simply add a comment to clarify the
separation (and maybe rename the function as well)?

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
