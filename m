Return-Path: <linux-leds+bounces-664-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C954E83958A
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jan 2024 17:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F17B291F54
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jan 2024 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519E38005F;
	Tue, 23 Jan 2024 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GNMBobsM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D473E7FBA7;
	Tue, 23 Jan 2024 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028677; cv=none; b=Y4Au2I1aBu/7pGBv3yUVI1c+7c+yU5wOK/WLqDROOAjJ6C/DKJhdkTRvuyYRK2N+i11IamGotHR8wpZbPSnaj57t7y6m6YYhDreRUzlPcFu8cnz/2hSNZqw5+9KLlsTGxhBMT/jQfkJyw72ipWKo6DzoJWk1/VJ4LwGagA8bJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028677; c=relaxed/simple;
	bh=VE3TwMTd3CZosuWs/YQh6GO1jbfQe0kjsCQk3Fo5jOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efAgRucbwvtDZaG2tnLcvkwG/3t2+BsJIIYJ3EzCw58LjKhueLLDUXHIuAHfuUyzxMQMrHz2+xQUWdMgLF6mvycWOYllf58xsfl2BZvRw0899CwRyYAs041IcfITILnJM0+FuXcVQhCsG1DKSo7BKUoQYD1G8gmbk5LZ0fU7Sxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=GNMBobsM; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9C3C22FC0050;
	Tue, 23 Jan 2024 17:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1706028666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdkokTZGvxcJHk9IiPC4nPROKX8TmRItLHJlrEqCNJs=;
	b=GNMBobsM25vzbIaUJ9ZsUXY1t95zxv/x9Yb3+W+7pAvEmJYGD68iisuOJAL1aT70kBltww
	LgcsjCrRpRcBlhU9ICKmB6aem1k8IkLgcVm+nXcdUMoKeDKUT6g+yb7SGTE3xnplyyTFTn
	3AqrmNSNTous3svtFzJSaayp9w+UIUc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7df49b4f-5d9f-48f2-98bd-e2c3f567126c@tuxedocomputers.com>
Date: Tue, 23 Jan 2024 17:51:05 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com> <87bk9hppee.fsf@intel.com>
 <ZarAfg2_5ocfKAWo@google.com> <Zar0MFelV4gY50La@duo.ucw.cz>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Zar0MFelV4gY50La@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 19.01.24 um 23:14 schrieb Pavel Machek:
> Hi!
>
>>> And while I would personally hate it, you can imagine a use case where
>>> you'd like a keypress to have a visual effect around the key you
>>> pressed. A kind of force feedback, if you will. I don't actually know,
>>> and correct me if I'm wrong, but feels like implementing that outside of
>>> the input subsystem would be non-trivial.
>> Actually I think it does not belong to the input subsystem as it is,
>> where the goal is to deliver keystrokes and gestures to userspace.  The
>> "force feedback" kind of fits, but not really practical, again because
>> of lack of geometry info. It is also not really essential to be fully
>> and automatically handled by the kernel. So I think the best way is
>>> to
> So that's actually big question.
>
> If the common usage is "run bad apple demo on keyboard" than pretty
> clearly it should be display.
>
> If the common usage is "computer is asking yes/no question, so
> highlight yes and no buttons", then there are good arguments why input
> should handle that (as it does capslock led, for example).
The common usage is "make keyboard look flashy", for some a fixed color scheme 
is enough, other ones might probably enable one of the built in modes. Most 
people I think will be satisfied with these 2 options, albeit both of your 
suggestions sound cool.
>
> Actually I could imagine "real" use when shift / control /alt
> backlight would indicate sticky-shift keys for handicapped.
>
> It seems they are making mice with backlit buttons. If the main use is
> highlight this key whereever it is, then it should be input.
>
> But I suspect may use is just fancy colors and it should be display.
>
> Best regards,
> 								Pavel

