Return-Path: <linux-leds+bounces-7658-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCyZOrVK12keMQgAu9opvQ
	(envelope-from <linux-leds+bounces-7658-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 08:44:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5543C6AA2
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 08:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54ADF3013EC1
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 06:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239FA30AD10;
	Thu,  9 Apr 2026 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbIHJwXT"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B882F99BD
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717044; cv=none; b=kUlOU9Gtvza+I7vcUoY7UDN4nirKz1Rw5A7INdHcN6MX2l432JN7qXRDo+jBb7+YHVTZc608n4QelKBXdCE+ULXkaMv9HCm1TKfCHYm0zDmLX1gTWqaoO3nRx1UHvfjvm2XLyYNNu58gM/glQ8T5TZN1kYfng0ztTu5Juu32fO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717044; c=relaxed/simple;
	bh=VdB9X2+YeYxs9yEer0MjDAnFlACrN7WN79Xv3H/EehU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3RuJbBLOEKiRcqAfvOxlwB2LctADgdThWarNmhTUo1LziM/RA0YTii5G9B6ON/wsQc+JzArCZbLvjay6HfXeBeDRZSuvByq/Sryn1gux3+eL/UrcXf4zqxVRSX/QbQMocoIr6lqiDKAWUrweB9qe5nliVodQDvri+XuY3QCiyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbIHJwXT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775717040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxsJgBdPd9otdbP3Nmet6BCVZts8RLIq3c+lIhsEXZY=;
	b=DbIHJwXTmQelpSeTVDvzxmuecObI0jrdlTLsperayqdIVKr/X7Z1fJsAxvWdK/Jjes+Thb
	UgNNztCNmKbvbAgfNV/EaA8KXp712MTJUIFjFvaGbrYZkFyyrVKIrxf1UuzIZYr5jsEPqm
	2VQU6rn6Mx92GTouvCLa6V8+BDeFks8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-qM0jN5nINBaVkntySZObgA-1; Thu,
 09 Apr 2026 02:43:54 -0400
X-MC-Unique: qM0jN5nINBaVkntySZObgA-1
X-Mimecast-MFC-AGG-ID: qM0jN5nINBaVkntySZObgA_1775717032
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8560195608F;
	Thu,  9 Apr 2026 06:43:51 +0000 (UTC)
Received: from [10.67.32.39] (unknown [10.67.32.39])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F6E81800576;
	Thu,  9 Apr 2026 06:43:45 +0000 (UTC)
Message-ID: <040c8086-2fe8-47a6-b095-5b1c3485e0c3@redhat.com>
Date: Thu, 9 Apr 2026 14:43:42 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Documentation: leds: leds-class: Document keyboard
 backlight LED class naming
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rishit Bansal <rishitbansal0@gmail.com>,
 Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
 Edip Hazuri <edip@medip.dev>, =?UTF-8?Q?Mustafa_Ek=C5=9Fi?=
 <mustafa.eskieksi@gmail.com>, Xavier Bestel <xav@bes.tel>,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Kate Hsuan <hpa@redhat.com>
In-Reply-To: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7658-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,medip.dev,bes.tel,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A5543C6AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On 4/7/26 1:46 AM, Hans de Goede wrote:
> Hi All,
>
> Over the last couple of years there have been several attempts to add
> upstream kernel support for controlling keyboard backlights consisting of
> a small number of backlight zones, think e.g. : "main", "cursor" and
> "keypad" zones.
>
> All of these attempts have gotten or are stuck on the lack of consensus on
> a userspace API (1) for controlling such zoned keyboard backlights.
>
> Previous discussion can be summarized as there being consensus that
> these backlights should be represented as (multi-color) LED class devices
> with one LED class device per zone, mirroring the existing use of
> a LED class device for controlling single zone keyboard backlights.
>
> The only thing which really still needs to be agreed upon is a naming
> scheme for the per zone LED class devices so that userspace can detect:
>
> 1. That the function of these is to control a zoned keyboard backlight.
> 2. How to group the per zone devices together for a single keyboard.
>
> The single patch in this series documents the currently undocumented naming
> scheme for single zone keyboard backlights and extends this with a naming
> scheme to use for multi-zone keyboard backlights.
>
> This is send out as a separate patch rather then as part of a series
> implementing this in the hope to get multiple drivers which are in
> the process of being upstreamed unstuck wrt the LED class naming problem.
>
> Drivers which need this are:
>
> 1. HP WMI laptop driver Omen gaming keyboards backlight control support:
> First 2023 attempt:
> https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
> Later 2024 attempt which includes an earlier version of this doc patch:
> https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
> Current ongoing 2026 attempt:
> https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/
>
> 2. Casper Excalibur laptop driver (inc. multi-zone kbd backlight control):
> https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
> This one unfortunately seems to have stalled.
>
> 3. Logitech G710/G710+ gaming keyboards HID driver:
> https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
> Posted a week ago, needs an agreement on the LED class dev naming scheme
> to continue.
>
> Regards,
>
> Hans
>
>
> 1) The lack of such an API may not always have been the sole reason these
> drivers have gotten stuck, but it was always a factor.
>
>
> Carlos Ferreira (1):
>    Documentation: leds: leds-class: Document keyboard backlight LED class
>      naming
>
>   Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
>
Thank you for your work.

The kbd_zoned_backlight is pretty useful for the upper-layer apps, such 
as upower.
This gives additional information about the location of the keyboard 
backlight LED and allows the upower to expose the APIs with the zone 
information to the user space. It also improves the user experience of 
the keyboard backlight control.

Acked-by: Kate Hsuan <hpa@redhat.com>


