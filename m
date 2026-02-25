Return-Path: <linux-leds+bounces-7031-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBgvA0crn2kOZQQAu9opvQ
	(envelope-from <linux-leds+bounces-7031-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:03:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D619B239
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8639F300E18D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8C274B3B;
	Wed, 25 Feb 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVfJPZr/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EC3DA7D9
	for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038969; cv=none; b=LtUNxSulypPAat2fZQwv5ev/e41KUMOV3F0spCki7PH5Zbhx2l8HfxbC2O4EtaX+xRgLzpgdgVfFel3mB2fCcQ5ocGeb+klhxdv0C5vB6LkScQunFM2FlD2u0gtmnxB40erY8FtS1HbP03m5H90e/U0LgtGSB093j9l29koNQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038969; c=relaxed/simple;
	bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8dQfxG9jzO9FlxT6DMhDzGEh6it2ClpkjXylp5r+ZEyr014bIG6NE1tbK/8EjwSQe0/Cn1ZFscwrCvWm1jJqviizeNtKSsLU66dfRYG3RNZ8m6x4JnVvRn3LTz+RNA70y1YsVKAmmSewSJs/M9MPxGmkA0YTMDCilDziPkcyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVfJPZr/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f8f2106f1so935678366b.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 09:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038966; x=1772643766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=aVfJPZr/WUlwIxGMRPeKoEKXI3tZDkdWXmCvfq5Q69da7vdBqM4hu/Hl1mAUSQnp1P
         iTg8BS4Qef5OsT8g/Vh5JmxrdCOs2vfb/uAiNpgWcatLhJl9HRRvZfDnQFhNp5KPbBln
         ZFTCRYkK59JqCsxKtrSI5ncHB5YZNF2CjF++BKVf6rHAi7gXcBs1CtIVTzflPiFd+YkB
         wT6fsTsRw3bQMkV727frxoN5/3pgE8R8yskUFc8g+paoKMhCuvvRiCwfywLexwoJtTXm
         Mx1VzuKRyxVBaT3KoKgqMA9beHRAgUcxkY6rwXR+LVySxRB3qUTSaXwQ4TLrKzDFVkqi
         QZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038966; x=1772643766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=G3ZfN1EOlG9fRovqA6EUUvtODkVDdNvcpOh9ZJdPoSd+hZEY+aRmJM/bGrqpAnFnNb
         mM2CSoYU1Nm3phLsaD/JRiIQ4234rwC8DXFl3hZwH8IyqF/4pk9IBZnCdCBeEqqZ8CU+
         HqZuu6op34hwAGbphTGCuMTrShFft+lfg/KgvFoNcJ8rwRmBcT+cRDWFqChUQ5lOWmp5
         xyqsOoS0rEhHhSAx7yaAyrw/G54InedsOdK5Z2dpjlDWSGTrxkFFhoGEzAkaucS0Ns6G
         JLk8EOLR2RoykXW45jgOiGq/WJOo7ZMj9yeSWAn2hetG/6f5zBUMeLPxoBHkmiEK2xPD
         sPVw==
X-Forwarded-Encrypted: i=1; AJvYcCXUvMPjBm39lgf6LW3hv0btqnaC6koOzhv7QJVYMl5ebOcCwUtMwtNL2cmpzb16HwOw9GVck0RAQTnu@vger.kernel.org
X-Gm-Message-State: AOJu0YzgrMCCjQKwc+lF1wqDLz7Pcvkk+EyAB17sE5nO7A23BwtgN4ne
	gGUJeT/O4+RNTiHWsD8obUKiYMjnSoYT8BO+YAq3vbg/PMPeFCyoBzlv
X-Gm-Gg: ATEYQzw3HxmSCZorSbajQe/PpNP6QnFlmxqbFTM50+HtqjF9Kgxg1oekXo1x0tahawW
	DETKr51uWN+y1HK9Jbm1j4c9Ru7Ryz7n08ao+yGnXZ8WKnuPJKQkvbv2zkeR2TvPL322CktPpk0
	QCdpIp9vns+/JSDNueUUocMbx3V2yvX/gGa5g/D2F0Wp1CRymDv40oZHvjdETSXg6kZn+iNemXA
	2wtQqfYGCQuAQMiLkY7aIpKV7lrO/7IO6PBVKUiWyIpz3Fz8eTCqhbXxwk3XAfKYei6TyaGy9kV
	IU78iyrvrmco8lJce06AEFIdpLelHeP5poK2IPg+s1ZUZFeQGEzmKPxtAtRbWg9QCnNTua+Prqx
	0eOLxx9nLnxuAtnGfc1MbEt067P9M+n/Kq2tDhkrOV+rQOyy5P3FHo3E8T1Xboi4hLe8hwn7m8F
	VAwpwAiLJHnoJikR5qrU8FVSGkPgc9eWqPse2Z/Yz/+OLH3NqAQ7l2N7r8FFGgAczqUKmTMySxa
	BPxdZnSAyUXBknjnA==
X-Received: by 2002:a17:907:3ea4:b0:b87:7042:9aea with SMTP id a640c23a62f3a-b935153e459mr63561566b.18.1772038964791;
        Wed, 25 Feb 2026 09:02:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm35504200f8f.1.2026.02.25.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:02:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject:
 Re: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Wed, 25 Feb 2026 18:02:41 +0100
Message-ID: <4714447.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20260225160828.1687643-4-wens@kernel.org>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7031-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D44D619B239
X-Rspamd-Action: no action

Dne sreda, 25. februar 2026 ob 17:08:26 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board features 4 RGB LEDs in a string connected to the
> SoC's LED controller.
>=20
> Enable the LED controller and add device nodes for them. The timings
> were copied from the downstream vendor DTS. The design does not specify
> what these LEDs are for, nor are there any markings on the board for
> them, so just use them as indicators.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



