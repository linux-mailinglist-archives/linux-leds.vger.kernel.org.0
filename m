Return-Path: <linux-leds+bounces-8856-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cwVPKfWfRmq/aQsAu9opvQ
	(envelope-from <linux-leds+bounces-8856-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:29:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23A6FB5FA
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:29:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tKWsGpzw;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8856-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8856-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB46D301C953
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7089735F8D2;
	Thu,  2 Jul 2026 17:23:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50672360EF0
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:23:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012990; cv=pass; b=nzCtqLBU2ELPUvGW9LprdDlyyIybXE6xgEmeAcj/x+QRJ5k0l8bEBq7G0BJGu/WK3VJ3Yst2jYJWgffOXkVSwsnHkyDwJ6wTIOh4aYsL2Dfj0Esl4PM8gWaFn/pEcLDyQR9h5MB4ACoXxPllNk7mQCQ6yj0gqG8hNKTTvufHpmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012990; c=relaxed/simple;
	bh=3LAd77ag775ZkK3gX8tuU5QMN4OfcfzmGMwVCEUf2CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAg1Y09I5jOjHQjw9ApfdP/pRwhgd18A3kuuc9lMQ30AZMhs5xpsF26pI1QM767flTfIUFWoYkfUJT53fDXuQUrvJCkBRVdqzapDxEltaUCd/onNovTz7dFM8DoA8Hsjn8LUYTZvQ0le4tP2nPx51Enc5OWT0mmBJVLCGbAVDgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKWsGpzw; arc=pass smtp.client-ip=74.125.224.54
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664eb8cb631so1882981d50.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 10:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783012983; cv=none;
        d=google.com; s=arc-20260327;
        b=kocICBxkqvM70N2izTnwEnTMjBguYHorAzOPK/et2Tz+7wJvJNFPETHhYlXxe0/wmO
         zHUa9I2+lC+tabi01eVk4Y2WANzA2ipwHixLJbs+vu/Af1gNMsZ9Lo4BNiKR620oTiAT
         xrjUBCAOSLMS7Omak0+5pDUo+L1G+79mmKRG5Cagw18tKM3UgjPF/Dy34s+Lhk138stj
         W5YWSyPVKnrVJ9Gd4wPurabaOAqJzs4bswXjBgSyRDhqo2OcMRN1OJIF29613Xe5OupG
         ZyK9oYc1z5pH82IKbYQ94CIDDvDP1wMiNHgmCkJV72wRK7QY8rhzoDpwHFouaFYjTtUE
         UYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3LAd77ag775ZkK3gX8tuU5QMN4OfcfzmGMwVCEUf2CI=;
        fh=22eO4cM2adSbgc73V0TqA0ZVR1oyW7mFKJDaWbl8o5Q=;
        b=REcuKPRRVXnSklVHp3XViA+zjUV+xEUZbBAk2hwrPu0wCiaFHMqkY7fWkdf6fh7HcP
         AZ1vPN2lNjBXJa2NLSh5bA1+EnaeXX6IV//GwiZGkhjhRAWI+bP61IV1RcVnmNP++cyE
         Vx5InJHXPqkOiMjjxXHKKrueeWMEECbButdLXaGqEBHddl1vd0Vc0l+/FOc9XidN6ob+
         9m0S4/3kp5RgijcXh9WM+AzvLesWThkGFNMpWvVCgkAcCVsZicWRmC6qDULfEY5fsBiD
         foTbPJhA+rHDBwoyGSF3psA0juIfVKpNHPpzOtmgLMseCGFuqKkbYAskzrCmrX9XVaNc
         anOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012983; x=1783617783; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LAd77ag775ZkK3gX8tuU5QMN4OfcfzmGMwVCEUf2CI=;
        b=tKWsGpzwuTp8rMEH8YoBl0T+NEbGOGiNxyqU3MJ6ElwAn+JJUpAMXGuLlr/oayjltA
         0B7BvT6X2qFgOO9/n67Ux7qEd/E7X7JDJvmzsdxuWMl2SphDuaU7puKkr/T3YIMmjmDP
         ydaY7zuJPDAY6cr84b6SmokVVtBPYIF6aWdtiGjS3MTvVHkYFc3cTp/jLTsQSFDYaToo
         RFcE1OC7SJSy8J+YDUGBrRUrtHB8eujFgmT7QZOtk8yHRQmp+/yln6GhKCDEva+cZg0y
         9sRCmJCbThf9qFpOVximglNBSopyZnR0na5kInLMyOhCcf8TEIrFRdWxfk+onlFnJM92
         gMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012983; x=1783617783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3LAd77ag775ZkK3gX8tuU5QMN4OfcfzmGMwVCEUf2CI=;
        b=qgNq4nXiIYsp44bmD/QP1CjjW838rTqb1c6W9twoQi5o9vwZrllkcT/Nv7qh06Xzf4
         Ikt+id3c175/LgYWMTb3WHpaytxgQH5nUyHLd8Wu+JEHc8zYKVeuyOGfhR2uaoh8SwoI
         vVbh7sBm223pd2uhoTPQ4BNlq0A4wOyNJKj4YQNQ+2QyCB3klh3fsv9pTh3++1d3LpOP
         CnCgCnxIG+7rzLOoushCwYml3PsYZTBs4UjLzlge/cOsoPiAf/ZoN3MGuVSQsCFaQbWb
         FRVYpo1z20cA6lkk1C/1eu/OWEY0Uh7JDpQ0Hc8F+ZlyWbmpOM7gE9MAdsIHvBhDd13j
         qtDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb4JPniSceWtFn+5nT+DFOE8ca3g5n0oTRkA0jOJCHQiTPF0WC/tPZkWBOOdR3MMarPVJ++LMTNYxd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZu/psP1yFO82HTDuT6aIc85v2cjzQ02gaYGQs5zAbUXrRn0a
	YFz7z15Y0VFB4CEPBP8dljJkEO99BM2Agd/mZiAA2PVDaBfSzq9Z0YPuyAa24ZL7vJ5E8C+g7JW
	f/wKWui5LPc9melNOMYjeeVKaz3j0dgo=
X-Gm-Gg: AfdE7cnS2oDK8K6Abj0tHdsc1ai1wa+ECfLKVjucY1FRaq0u1zymqVxbZMItT78xYIU
	NWw6AFD/26cLJflLLAhsc0/+PQjKqecKy/4VTvZDNRL9ON+v70iFOHneqfRWGzbyjp/r7opTNAR
	knU5OqvjDpqqzsNvMIsWQIDWcJtXO32SF6QFKkybX9fNj+wXmaeRW7wgoJJ8JZ7D9SAMIHKyYAU
	6YEyYavQsYjVnSU4zbcDQdTfbcp248I66y4boulj7cpBIryKwVEKle54XQvffVKQPOIq6Z0UMDa
	2PzpKmor7PtqAORDcrMhP19V97I=
X-Received: by 2002:a05:690e:43d9:b0:664:e6d2:1411 with SMTP id
 956f58d0204a3-66596608627mr3795974d50.65.1783012982830; Thu, 02 Jul 2026
 10:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618142133.27377-1-mertsftl@gmail.com> <20260702134935.GO2108533@google.com>
In-Reply-To: <20260702134935.GO2108533@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Thu, 2 Jul 2026 19:22:51 +0200
X-Gm-Features: AVVi8CcUNZ2TztlQAGGSB7_LPGbJWMRXimw9i-75Xj8moxw4lFKjobtcVDULLKY
Message-ID: <CAA3NooobiVAzHcoJPTuFur9n1F=z5z9aYRqSJtD0CR3i5qYtfw@mail.gmail.com>
Subject: Re: [PATCH v2] leds: lp5860: Return an error for an out-of-range
 'reg' property
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8856-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,vger.kernel.org,intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F23A6FB5FA

On Thu, 2 Jul 2026, Lee Jones wrote:
> This isn't a bug introduced by this patch, but while reviewing the driver
> I noticed a double unlock in lp5860_device_init():
[...]
> If lp5860_init_dt() fails, doesn't the jump to err_disable result in
> calling mutex_unlock() on an already unlocked mutex?

Confirmed, i'll move the unlock out of err_disable so it can't fire twice.

> This is also a pre-existing issue, but I noticed a potential
> use-after-destroy involving the same mutex in the removal path:
[...]
> Does this sequence result in lp5860_chip_enable() locking a mutex that
> was just destroyed by lp5860_remove()?

i'll swap the order so device_remove() runs before
mutex_destroy().

I'll send both as a small two-patch series crediting you as
Reported-by or let me know if you'd rather the Sashiko findings be credited
to the tool instead.

thanks for flagging these!
Mert

