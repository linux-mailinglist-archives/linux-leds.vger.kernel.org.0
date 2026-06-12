Return-Path: <linux-leds+bounces-8582-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3nDBRhLLGrFOwQAu9opvQ
	(envelope-from <linux-leds+bounces-8582-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 20:08:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE367B88D
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 20:08:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=v0OsucTp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8582-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8582-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 033BB3061CE8
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 18:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A49D37BE87;
	Fri, 12 Jun 2026 18:08:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1036AB4B;
	Fri, 12 Jun 2026 18:08:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287699; cv=none; b=e/QpZbr5Wa6eD4M+veFolPC+irQ4fFeiLESfHvL41kZb1//ppyyzUE+sKy2T4KKxmpjsbLNuI8vSJ3IVFd4/bCIeFNl82kWW0CTMYEnLULMAfyxZbMXm06rEA3uUagr2OtL0AmwjJVexESjm+sptcjX7Lz9k115pPvx6I0Ry0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287699; c=relaxed/simple;
	bh=XdDF6SesZR4kGgKugTy+AKxjk7nrQPAOj20/IxMcNrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I91mIg9S45zgFOEcsQUd515t5vubPbd9tLUV98ClQjVM8bYW9JQXZFHP1YmGPaNMosf4gmAFcN2XjKnAmHH1jvAGvpy547YpbkaJV2ffDcAjI6KnEjkgeUtlOijLHeAaSqzeMnG79AgrTW3bLfSdzNRa3ilzJjMzPgq2Pk3cpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=v0OsucTp; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=RxanrPFArRRTRhc509e3INMJnv0i0H5CfoaJiHbkTLs=; b=v0OsucTpFwXQLP5Zb+T8+gUSfe
	sXyWmVj1EzhFt59eM051pYSubB3g3CD/+SmJN1Yc951HU4a1vtuvE+oDv7OAfctmQcJxSSS5qzwWO
	u7bvw8E9o0eqX2T5qgNJsLZLdnUpzNhZdEFaAlGFBoSFEfrWIiXJRZl5emhL4XQvMmEDBx/H/3kUi
	j49S3kWQNekX/qIp2Bl59HGx0HS+izULLeYHh3zPy+qiUNxsjPVNs7XN8b/m62+o63rhGwAs3QQVR
	tnPTDYzC6Qgcry6cLsvOQgAfNhiJh+14UOdm/WhoLs91rRnVYPZQO+qyR65tefd0BuSCRQ3XBTjib
	O3piDuPA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Ih-0000000BOfd-1T6K;
	Fri, 12 Jun 2026 18:08:15 +0000
Message-ID: <25fc60ce-5fc7-416e-bec7-d7897d84c038@infradead.org>
Date: Fri, 12 Jun 2026 11:08:14 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: leds: fix broken reference to the
 multicolor LED ABI
To: Shardul Deshpande <iamsharduld@gmail.com>, Nam Tran
 <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612171528.728111-1-iamsharduld@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612171528.728111-1-iamsharduld@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8582-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iamsharduld@gmail.com,m:trannamatk@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-leds@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73EE367B88D



On 6/12/26 10:15 AM, Shardul Deshpande wrote:
> The reference pointed to a non-existent .rst file.  The ABI file is named
> sysfs-class-led-multicolor (without extension), so fix the reference to
> match the actual file and resolve the warning from
> tools/docs/documentation-file-ref-check.
> 
> Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/leds/leds-lp5812.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
> index c2a6368d5..12e757d45 100644
> --- a/Documentation/leds/leds-lp5812.rst
> +++ b/Documentation/leds/leds-lp5812.rst
> @@ -20,7 +20,7 @@ Sysfs Interface
>  ===============
>  
>  This driver uses the standard multicolor LED class interfaces defined
> -in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
> +in Documentation/ABI/testing/sysfs-class-led-multicolor.
>  
>  Each LP5812 LED output appears under ``/sys/class/leds/`` with its
>  assigned label (for example ``LED_A``).

-- 
~Randy

