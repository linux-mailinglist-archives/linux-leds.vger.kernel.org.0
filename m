Return-Path: <linux-leds+bounces-9015-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fv1YG/wkUWrK/wIAu9opvQ
	(envelope-from <linux-leds+bounces-9015-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 18:59:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2F73CD4B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 18:59:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WGGVRCny;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9015-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9015-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FB0D3041A13
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0495D43F4B9;
	Fri, 10 Jul 2026 16:54:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398E43D4E9
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 16:54:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702494; cv=pass; b=qo3Ry8O2NOKRuXV6ax6OuhlOQ8PsXcK7ihuT9iS7SbmiWS+33ezmYNlGkTt8OZKuaZ5BEWm83BrT9lVp1DuTLJsQiqP9BIQX2ZVwsYCxDxrxhPDXoa+2Zx4xhj+GKSgR0Xo7kW/u0SHlruRWhHUOapoAJqBDFlbIv5QCgRkBDvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702494; c=relaxed/simple;
	bh=1bz0iLRwOyVAE4lY2pWNaKBsBIAhNTgxQkt5Osg9LKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4+fNAOhJf66Nw089v2WTM0YpdphliuwvKVw8BtK5jyAAXUKr+u5Hu387cpcCYbA1feHAp1KzZ//dwAYF6ihCIAb6Y0mNh8KsIIUr/xdN9jLO1dTvL1QqlMWwsZ5fgbNO7C5TsMXnnVyHTsYC75Q5jFad4DAwT8c3yZEYoRzEMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGGVRCny; arc=pass smtp.client-ip=74.125.224.52
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664e3ed58bcso3390766d50.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 09:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783702492; cv=none;
        d=google.com; s=arc-20260327;
        b=IpY20uy9Tyd0UFMRPulRjqZYXVN2LMeyr/ziOg8c9nAUr5+XFlbWx8+v2m9RT2bZry
         X101/hd5URIwXZiKMmVRqwlmjhAIc8/D/zw4LuGkEg0SJ14JkQTOaE8A72WcdI8oPddo
         nTr5u0WNJ/O0xbNVt2E6n1yv1gS/PrCuYSxgk1vZbzVpf8VO0h5gV0TVcC95o1Xgqxta
         CVQv07EUGYYJ4ChQEEn2SaoiVdSw/Ns8Xk/75sYAdYpKp7Vi3Yu+iYaHYCIIwU74GFVd
         7uBNhmSuPTjozroYGR6qvDihg+wnd3JdkFLF1QJ16Bey04HIlizIDu+575Ky41oIKg0R
         rVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1bz0iLRwOyVAE4lY2pWNaKBsBIAhNTgxQkt5Osg9LKQ=;
        fh=eukgLrI1w4MZUSfTJ7/Olz4SYq3IFB2Z3IrMZZ0AhkE=;
        b=UO2ruemirAHlrJtu7PGTVhi1IjeH6nsFMYpH5SAzw89IyQdYnEVHBEPFrxVnP/UsxA
         ifINCMdhrO6363Jm9yubXRrwgmK2bfgRNLZzp6cIpTLlpBYA0h8P95z2eli6kSpMpIvY
         0njbsScI35MBHIJjZskXEmU2929w/At8HYaMzZZ9tDNblol3bv1XdU1u3wen577IPZUs
         iA+FBxt6f8KmbDZk3gM+/kun0wjBBJjTDqYUZOH7ONRX/UtLtPNUwFSU/9fm+YenA77u
         0qBn85jnPtAmnBW5FY+7vhn1D0lqf+sLom8wk0rHMBiqsRJbrkCZmALVl4CokteHb+mo
         ug2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702492; x=1784307292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bz0iLRwOyVAE4lY2pWNaKBsBIAhNTgxQkt5Osg9LKQ=;
        b=WGGVRCnywyJ0vA4n/CEnFUkLZAXX/HaNXwRMbcJ+jv52Zs1f4TO/zpvVb32V3rQfQ4
         CXaqeh8ACJHVb98FElbbUrnX/cpei1h/c22nzJUaqAmd068YPHsm6fXV29KkZNTmbg+L
         CXhbiuBw1fNo7oAR6vM+KzMjhkFc/8ya4kTAqikBodkzTfRNNCLOxH86ipeUVn61uCpq
         eoplVcZ9YPFRVHi8J4YlqP/CUfHzk+wsJAdj5hpuSHFNe44HRYPNZWMkjdqvyNwSYbZx
         jJjCsBiWcC4W/IS/1zwquPpRw/5zXlnnlJyMzWf4x2wIwL9X9p2GVqpSrjTIA8vclTJy
         1wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702492; x=1784307292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bz0iLRwOyVAE4lY2pWNaKBsBIAhNTgxQkt5Osg9LKQ=;
        b=p7Lf+6sXG9N1/dylN7EDGN4N+jx83m1EhCqa/81GhYum6rgY7f/fv/zuyNQNvUrzVF
         9UamOyff3cSrhnv4NbjjaqJm81FxdNdqh279J4+I8AuebXRyyAmvkaHMk0R2FoWdXgtc
         mrdSLbcol/9ub8mvHDDLCdBOp/DJ81jGx+vAk36GM66ZJE25WUBkt52wyBELLZybiVh4
         es+GSNZop/8a/SQhjki2eD+bvuWazQb/BNGcZBRVa7UgBPiolT1tg/b7P6HbQY4xQvZa
         4kfyphRMTs7lPfrQq8lEjHcoMXASmgxOuOtyw8oyn57svB8oHUuhwbfWXBEiZdU3vkaf
         NaVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6GOoDY+4AONCDGBQteYjq4efBavjr7AFmHzzx+KHvGidhZoAzZ8+BpEs7mGufXFO+50F0KeVl3+S9@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFHB21cyakO+UexYsaHu4UHsEuovtofEhcjzvK8Xvgo0YQ8Cr
	0HM29fVgyYStp4sf3v+bcmiTgSnFQE9f2ejeGU2KlE0WImbIM0PLT1l7E8yb4ulhDk6ZjZNxHzK
	sZXqqa5vdfhqBm3Egh3HTKsFwkxvG//8=
X-Gm-Gg: AfdE7ck1n7rI11e18ieAJjxdFvZaznKLDlr4sYwelAdgeDVuyZRZZkUJDEEgI6WzNGD
	i4xdffD2yvP/uVMUeaqBnHLaO8QJnzr3DF99vAK+0iJU01Hl0RwAyxctnxUnUt0YKB6t01ofY2D
	QSLdafnwPhU5LjyUiFGYv77MjpTKHptXY1isI4nTSTzLqBN6Elokwh8s6njbCbSnaXFQ+rf2Bc7
	UoreJ8YegzHDJIFZPLUtZ67YB2KnceHLWNB9qFuol0oDOgyUVsuNaHcPCIR4CSiF+VK1Kn9IQ/9
	PosMoMePqTZxzqaZnnrvubC+W1M=
X-Received: by 2002:a05:690e:450d:10b0:664:c444:39b1 with SMTP id
 956f58d0204a3-667c5c7dbf6mr2374928d50.39.1783702492349; Fri, 10 Jul 2026
 09:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618142133.27377-1-mertsftl@gmail.com> <20260702134935.GO2108533@google.com>
In-Reply-To: <20260702134935.GO2108533@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Fri, 10 Jul 2026 18:54:36 +0200
X-Gm-Features: AVVi8CeyRoWqJDfqa7DrlfMvYoEMv9wr1R7NSfp2k5SmtHGwizQZ_HpNjfJTl_U
Message-ID: <CAA3Nooqdrt6pMMNVdq8gh5RZLjAkrRzboF7n-_SZ5oL91KHJDw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9015-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9C2F73CD4B

On Thu, 2 Jul 2026, Lee Jones wrote:
> This is also a pre-existing issue, but I noticed a potential
> use-after-destroy involving the same mutex in the removal path:
> [...]
> Does this sequence result in lp5860_chip_enable() locking a mutex that
> was just destroyed by lp5860_remove()?

Hi Lee,
following up on the use-after-destroy: i looked into it properly and the
swap i mentioned isn't enough on its own.

Even with device_remove() before mutex_destroy(), the mutex is still
destroyed inside .remove(). The LED classdevs are devm-registered, so
they get torn down afterwards and led_classdev_unregister() sets
brightness to LED_OFF which runs the blocking setter under
guard(mutex)(&chip->lock). So that teardown locks the mutex after
.remove() has already destroyed it.

I reproduced the ordering under DEBUG_MUTEXES with a small devres + mutex
test that mirrors that teardown (i don't have the part): with the swap,
device_remove() comes out fine but the mirrored teardown still trips
DEBUG_LOCKS_WARN_ON(lock->magic != lock), and deferring the destroy
clears it.

So i'd switch the lock to devm_mutex_init() and drop the manual
mutex_destroy() from .remove(). devres then destroys it in LIFO order
after the LED classdevs are unregistered, so nothing locks it once it is
gone. That covers the case you flagged and this teardown path too.

Thanks,
Mert

