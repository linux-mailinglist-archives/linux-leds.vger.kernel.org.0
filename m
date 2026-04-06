Return-Path: <linux-leds+bounces-7631-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKGSIlUt02nFfQcAu9opvQ
	(envelope-from <linux-leds+bounces-7631-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 05:49:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E72423A15B8
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 05:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF0530075C1
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 03:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1381130F7F3;
	Mon,  6 Apr 2026 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOeOpI3q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50A21B9DA
	for <linux-leds@vger.kernel.org>; Mon,  6 Apr 2026 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775447352; cv=none; b=jL6jSVY+JKi2crxpXGqYDb6O1ZRMK7wFRPQ9sTVUaOw1tE9A7OagW9uujUSmugwKy1i83Lqig51dJlieeYlPafMMIiaizh1VhzF36eQIjEkuCaNabT5crDro9bZ9fhIOgCEkGrHdCxfsHV1HhJjopxT8keTZ9zFykYFiMLcymCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775447352; c=relaxed/simple;
	bh=TlTVsunSfixzAFsGvAOwd9wYDz24NEgIjzO47N7EVqg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WmQAmPAfBN5cfF7NQ2b0UHAqHa/s6pI/Sy/FBugkF6u9p2PE5syQmNp3vWcKzDxVCuad1U3wA4ebgawstIMgunwtTIQ1ptM2jkT3bWUcL3rF5BO+m6hHKq1BPIeciEOcBrS0DVwPrjiuRr2pKctUFZhjqm593gM+hUtZ7mWv7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOeOpI3q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad9516a653so17213585ad.0
        for <linux-leds@vger.kernel.org>; Sun, 05 Apr 2026 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775447350; x=1776052150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0BKCAT7lBswurLoR7rMAQLaCTljOPGjzlcHbLP4ufpU=;
        b=DOeOpI3q4GUahaAWXNyT0PzWAuYt3enTeyOpLDSMy8uxYd9cEUoaXy+9JvwFvHhWYF
         Z6bHz4zniwvJp5v7ba2kFrPALolgoi+B+brY+vgqEMD8Iu3M9R0jrNLSSmsfkdYZA3X1
         RSR5aWKWIoUMaoYrkMzC7rKgG56IpKF9QmwMiwkFtBWs2eXUrx7lDW/PKdqdeQfpYTHi
         9chOfTTT/Csn0LW3CRtPLR+xurqF3BtFFkekbtqbI6P0rlR0C/C8zyPP2dSVK8U5CfG8
         /bWA+S5RTUNKdhGof/XqV/i3XQZYvJkGe7gRsLqxz2zpAIjo9SePy6YPV8KP/K97iCEL
         u4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775447350; x=1776052150;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BKCAT7lBswurLoR7rMAQLaCTljOPGjzlcHbLP4ufpU=;
        b=aWjyVUqFh9qraZnybfyytvXSAMPIbl6z30xBhaSe2ThUCdJeQeMOjYFKR6yNjCqABm
         TnlCHlIBvTjKXkZsJynRFGPfxiAOQNRU7r8+oL51AU8URoS+46FXmj/0vuPPjBPR+ROY
         juCfZ9wlbhuS5RUSl17RgOsu6yYMVVqAVtWnTICWLG9qSVk/gvu37ZlAXuKvpbF4xyoc
         pbN/F1LpDg1CQ8LuoDO4A4URgbMhRTIUBu9o8/3FmI+jfmzULkdZ1aH4gbUsA/hDn6df
         rrg1C0zd/NQPZCocAiUISxg7vtMRD0886MZW6kJccuYg5ZlWvxn+nhlatkQxnZpWHKgV
         YStg==
X-Forwarded-Encrypted: i=1; AJvYcCWpPKrVtkwvFGNL2zGQFxsdPGTxbxcYIidsAJOJr1EXA1U9/DALsgYsF3XkUZDyf111E4fxf99Ungoz@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9W4zfGI1TEJ6QW5EMbD4u6C5SZYYMtNcs4zRQykVpOIxlEK4
	+ytpHWOx2appgxYO4GYH+uFqgW5eCLfL/XyWpAxxLDXOsKb9kFWyAPQ2
X-Gm-Gg: AeBDiev0iHKGXdOgOF0NcN0My6EhjrD3k5SLabNVAu7jgiigxN7n6ohat+yLDlh8xwz
	bQTSYGPXucApgX/3PxkJtWMpk8cJ8YmysETxdsrJ14F2mPgV+riJpzw6mSKgylnTAQVYkSCVA9i
	KlZLFfRlpWWo6PQmEpJ5QETY4oKjf6sZkV0P7z47EsJ6XntaHVCKblofCdOB+cYnABYhRP5J5eo
	1Cozr7GE89lR5S1zxVcGP3l/k82YX2tJOLZSVt2XgHRSSTgojsemiGyy+0zCPBSeT380Aw7Ky7i
	hVVIXLYL7IRBSpiy/xWRZrAC3FAZABg4o3g78VUveCmDi0pyKDGerCYdT93muUR25bga2TpW04w
	1eK0CZf1PRURWbBc28hPE7aHQNfU59FcK3+MGim1U32GRa+CJOGISurh+X5GwauPX+NFmUOLdB2
	00mbf0XPnhEQDJ3DblxFehIOuFF6+aLdEL3rawo2tX7JJ9X/sp67xEsEh2gPMwepRPenfFKHzHs
	7mnhb/J5xIaarKiJI06CLJwsf1Jhf2XSis8BmtQY25Q3Ux4YQ==
X-Received: by 2002:a17:903:388f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b281789c6dmr125370095ad.29.1775447350149;
        Sun, 05 Apr 2026 20:49:10 -0700 (PDT)
Received: from ?IPV6:2401:d002:300f:4a00:69b1:854d:1478:44a6? (7zyfljft9qk2ch4xzw86.ip6.superloop.au. [2401:d002:300f:4a00:69b1:854d:1478:44a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm128031385ad.19.2026.04.05.20.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 20:49:09 -0700 (PDT)
Message-ID: <51b03477-8007-4d43-aa09-39b80dec931a@gmail.com>
Date: Mon, 6 Apr 2026 13:49:07 +1000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: syscon: Add tristate option
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308015824.2318366-1-bevan.weiss@gmail.com>
 <20260308015824.2318366-2-bevan.weiss@gmail.com>
 <20260319101327.GH554736@google.com>
 <20260319223335.5e1913a4@openwrt-virtual-machine>
Content-Language: en-AU
In-Reply-To: <20260319223335.5e1913a4@openwrt-virtual-machine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7631-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E72423A15B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 10:33 pm, Bevan Weiss wrote:
>>> +MODULE_LICENSE("GPL");
>>
>> The MODULE_LICENSE() string should match the SPDX identifier at the
>> top of the file.
>>
> 
> Sorry, I'm not quite understanding this in the context of other files.
> Most modules within the led subsystem seem to have
> 'GPL-2.0-or-later' as the SPDX identifier, and MODULE_LICENSE("GPL"),
> as I currently have here.
> Is there a different subtlety I'm missing?
> e.g. leds-adp5520.c, leds-as3668.c, leds-blinkm.c
> Perhaps MODULE_LICENSE("GPL v2+")? although I don't see similar
> anywhere in the kernel.
> I'd expect MODULE_LICENSE("GPL v2") to be for 'GPL-2.0-only' licenses.
> 

I've got a v3 mostly ready to send, but was hoping for resolution of the 
MODULE_LICENSE query before submitting.
Can I proceed with MODULE_LICENSE("GPL")?
If not, what value should be here?


Regards,
Bevan Weiss

