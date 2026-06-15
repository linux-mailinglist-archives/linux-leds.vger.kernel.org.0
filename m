Return-Path: <linux-leds+bounces-8591-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8yn4LjKaL2pWDAUAu9opvQ
	(envelope-from <linux-leds+bounces-8591-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:22:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642F683BE6
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Lt18b/C9";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8591-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8591-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15E7B300C834
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 06:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B981B3B0AFB;
	Mon, 15 Jun 2026 06:22:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854E2F83A2
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 06:22:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504551; cv=pass; b=dJ6G5BaiCpday/AzNBMwJh/3tfSnQaJgwooIV5i7vdKGYZtfniewk32W0buCvjfRaGYC/4cnxTZm5Mabm+u1mVQ4wLR4HgQCP9Ckr+KCxUEd15lE/Y32z36xPqG/vWf7zFKUvoQ78PP+sAtbmb6F+BWqnjpFz6dnPrI+FpxbxuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504551; c=relaxed/simple;
	bh=XqPNvehOEnWaZnXTerBcQEWrkudRd/l6+h30K5DXrNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQnyhUgyoY+FDo90PijDGJupFKpA3BiL28hqhYGgCgEDZUW0DEMVpTpNrU2ejCjDx9nxKGYM4hfJE/FY/u/wWxo/XWOW6MhvWfd1yrrNsMDxfOqvuYc0jZnKrERUG7mi4oxFckj7hLjGxHmTXZ18p52xA28/Zfeb5OspIad3jZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt18b/C9; arc=pass smtp.client-ip=74.125.82.49
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13807d2f898so3190193c88.0
        for <linux-leds@vger.kernel.org>; Sun, 14 Jun 2026 23:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504550; cv=none;
        d=google.com; s=arc-20240605;
        b=ie9NvY5sEZ+u4Ix9Xl8naKR2D0teVS2BI8BGgozIVZqJiSA21TG5JdmDt7if4yoTfL
         Um/DiL8r11fvbm6JWIiA61jn5IcFVefTlzkiw19YqN4hYBJK+Emg2GLrdLmNg8DnG5N1
         aGfcV+0I/9pgq4yqxneBfy2DBivCSDWXzMUOsaEGHCihAumcN0Sp/kIOWS05glZ9p6Cs
         2AlumLN0G0B2lbsZB70a36k9kIdBPE9gur12jBgCbEWZw6RAIrXxrr+GUIi8+taZprdp
         GnqaRKoHc6J73Ra4lUmd2GOs/pB6W+4KdLwhpH/PWfYoVFY8NX4lUHXbBNEja5rQa8Bg
         0/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        fh=MQcBVKoAcBKwRk9Axi/Bs6KaRuAqBHLlCaBiClwrssQ=;
        b=UOjnbSGgQdiBBxeT+mi2Ax5tpod80RhILhil1WghOMEHXsNtrnjXMEdiFeJmgXqmvZ
         HBeRKuMI05U3+1H5+WXyyBVQzjegvIcurkNyTbl3qQ0qIerrF9K9q9Z5QwKCCugkWaVs
         ZILY5BYHOtml3foXCZyhPOrHIeFsM47EFTwqwwn+i9e8iCHi4nKvzF3BsBfYz2FaCGWN
         dg1HaBdmhxhRRpi+0qBwHUSRjmX2Wc7HKvdJL3UPduV0HnnGgZafcU5zKYiEA4aWi35s
         Sh+cr9jhiDXvL625F41QQtU32z/98Q+2XuOwS2KPRNkVZhXCa5SixI52u0eCRld0HfGj
         2q1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504550; x=1782109350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        b=Lt18b/C9Sylhcm5L/XuLyFFbipurTD2/ybMblL6P7LxWeIt8KkJdB4kVxFrz7SmZGl
         7bRyScP7YI21bux4OWJo/kSHLydpe4KVXMRs+Ot4E4T0ba0r/qvcRaW+35ytO26+1tER
         4SMvdYINuXEaC8wcSt7BAXGo+qA02pfhWyC4RkF2iA0QOz8qL5HiNC4TDk/0iPPutCuq
         R/VjZr1R7/9LHwlJqkWk7UIgO6DslBj/bpiZvkh/VVtEiChAddeMgY8FOs9BoG9pdBtA
         kZZSZh0GiYI12rMA5bmxMJzjTr9qQNjsXLVx7y/dNjxSck4v3+PpezH7dRyu4OB+3GlI
         /DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504550; x=1782109350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        b=Gf/Y9bOBJR+ozOuqRj51TuhioCK6E5T+ehjEFH8hubBclxMG5UMCEA4zmpNcSpk9OJ
         DD2KltYFESQng9r1oDQGrVHVf87EAMjFGTYgCY4t2K2idgmaIXmV8fRmdsiRBRpsnyaR
         jIwjul9kmhRUpMvzMQ2dJbUu/rBtBhmmhZRsapimAjUV4X01j6cAJ8bZN+3VsBE4Z1im
         wkDFUdwYKqiFhawN95N9GOY0rXiTaimwXPHoyiXwURvenLpOK0/ZwKPuePaqe8aEZm8O
         nYBWeiZXVfQtBv+GqaxJdoPZ2R9ZQS//CQuCsKU+fFyth3/RzyYV7XnCyNkp66akv01S
         1HGg==
X-Forwarded-Encrypted: i=1; AFNElJ/Caej+sHaA8LK0I4qwAdY/uKrmDyfxKgz+D2E+28k/S4VybdDv+c3MGsPF7ACcREPUEEnhwqHOPTbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8jjRGl3cLw2Lgm2EWdS8oEhW9JGD13GnprIR/a7Da3PGbUVgP
	cJQQHbQfg9l4h4BUIrBfJWaDMyUpYDHZ7BvzN9YX4/bcZYTVT1huNmDeGqgbcOJ0xrps7393qul
	Ok/r7PiTTDDbwE62TexqxIU9rLC2PN4to+HrnMoE=
X-Gm-Gg: Acq92OGtj3OoRMTDB9E3rrYPcYIcOOql1wEbYHlVEdIPEXOPPRIbzYcBMN+uROZNEnQ
	6GKTWYvL7OmBmulhA44Z0VqnxFAt9C+ITbE4YwJuHZ3Raefr7WbOo994HzHl53NX3mWFvPuTTZ9
	QRV5gFm6KcAu8cT5C3WyQMMf4GGbSShx8iTqLJ9RRPVoV/p//ca7ERuZ4+lPZrHRkqe0Ez48T7N
	CMBiCch9wyicZW2VvW1MP+boju7xzxOcjs2mWdykmlsjODdaE3T8eFKNU4gFMhk06SsZ+Tna2eE
	xzxZWJjz
X-Received: by 2002:a05:7022:f111:b0:137:8bc2:f501 with SMTP id
 a92af1059eb24-1384baef050mr4646305c88.7.1781504549538; Sun, 14 Jun 2026
 23:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-4-clamor95@gmail.com>
In-Reply-To: <20260528053203.9339-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:22:17 +0300
X-Gm-Features: AVVi8Cc0Nlsxbb5zkVkx0TdFg33anyYPsTjQbMqYQfW4SlpkYRj23DSVmIPKM94
Message-ID: <CAPVz0n0g3iHniWH2inESPf+xNv52QW4bc0h-Fh3KtVRpiwZGfg@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] input: serio: Add driver for ASUS Transformer dock
 keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8591-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,agorria.com,rere.qmqm.pl,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3642F683BE6

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 08:3=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 ++
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 158 ++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c

Hello Dmitry! May you please take a look and Ack it if you are fine
this this driver or tell what I should adjust? That would be very
helpful. Thank you.

