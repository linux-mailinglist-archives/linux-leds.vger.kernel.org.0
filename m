Return-Path: <linux-leds+bounces-7030-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CANVNoYrn2kOZQQAu9opvQ
	(envelope-from <linux-leds+bounces-7030-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:04:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30119B2A8
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4298230B6C88
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89003DA7D9;
	Wed, 25 Feb 2026 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXsd8sLl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B93D7D83
	for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038688; cv=none; b=ZR+UqhoZaYZwraGwj4Nr6VrLFlaLryTvnAQWbJI66Zx6kfv3iKpXMTfAeKlGj7Eva6lr3RXsxqfs47FuoaSrMX3k8CR8pr5DIXqlZuKSeTD+v7mtC2ft+t5Np/gz/BikxaXVxvDb9NGbS/z7OinQNpSDHBBOE13Zqxhq9nrEM1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038688; c=relaxed/simple;
	bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvWRPEp3V50UczQOQuamOBzM8IQ22rSfFgkCJy73ICZeNZMjbd/GzIYyxJ7yiZ41gd/xKsHvu7TZW3ZqNJbVAE41VuX89u7bi++DRTWc+xf6C45fLy71tpesbg2iz734bVLyxLErlB1hrpJGGGsm+nIQj/iyZFTOlzPEyJyvOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXsd8sLl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48375f1defeso48454015e9.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038686; x=1772643486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=PXsd8sLl5ND5aTXr6Mgjme4GqIbpZrFq1nIYXjq4Uz4voGLpiCT8S98CcK440KJFlc
         R3DLh9nSsAl5H7jHyWdEqc82jpp8SGP9XvY3ta3UmvAKgj7jTqTzkhTRzZUn4BKHzZM8
         Yg1rqtE1CwCDKzbCc8Qo11byPDmvahWijsJCMnJO2zvmDAvgz2O7Laqr52HaRRu6p6r6
         I63k73GsIkcalwtozR+UGlyfXIAMCRvQhPParNcjFs7gweRPtGaHISJiY54vRc6H6aeh
         De4p609c9mhXioExHHRBjXIubYmFoMUue1S3KxIYJoAaRJl8TJMxeQFIUWpEup/HfBwF
         b2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038686; x=1772643486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=cz2VPphKZIXOIYg3XUv70g8Qo+hMo4C4MkgrToTRm7x0ymvqSMLSbifMnJVI3y3bkL
         2qXe9HAPov7O9KBo2U3udhjAoygQ4pqHseECCg5KHigB1E+9Vs+G7GjcO8oZJFGKEmSV
         /8G142ITQlAF7/P5V4a4aOm+oHGQYwNgm+9iRT4oTMFF/JHTmXNIFmJWm2O/gJQ9iSKs
         aNa7x1vWFc4Anxvlyb8LHfR7TA5k+KYn1v1ZYoPGath0pXTBs9HmE+cuJ3N1GK+liyML
         LIzgYIlmTxBUNBgNzwYuV/lvIN7QFcfj+MOd1usnJU6/aOw613dlsF4s5LvTcb7l3iR0
         E57A==
X-Forwarded-Encrypted: i=1; AJvYcCXLXQkWViowqNupHXEG4RAo7GA6F6V9rL/3+Qha5GSay4uO1My82tfKxROXFBAhXnQoZaq2aDqHkByg@vger.kernel.org
X-Gm-Message-State: AOJu0YyrzloAp8oMBEJaUrAXToeNwohodic7uRw1SHyip/Jk0dEuSdif
	zNMjlDxiIltztZcO6My+U3nyYO8QeKJdi+HJoFP2ZDH6QY3YHzIm1f7R
X-Gm-Gg: ATEYQzxT6L0kVFSw4Ms7P8aTIczC57IqcCdN2LrvlEH8E4cvfJwqUq2OajBfvAcIE3v
	rautwXT5c8tZS6XvHk8FK/y3a0KMe5O9+YQiUVciNDD51Zmf2xMVbcGF2hJTCo64TykFCrnDkUD
	yen4fIkKcKGKbiHZhTsgxkbg4Az8rTLDQMh5XfAd/EySNWxlyuf3QMXh5njmjdMcdY9JP1VEAwC
	c3itkG0nf0yEwmgaA5gsi//U/6A3un2yjU29IbFAJJBGRUSY0OxEr5PGakT+Fgdwog4E/58zbZq
	SMV7r0B4iC+XKKAzfy827CaB+KcKnIZMguFSuPtvLmA34zeaa3F/yvV18D3dWH0dWg3QvIorztU
	wN301hGX7rtBReHnj4oh/nHO+Yyxg4gCOFnoVvhUIUyGjFtlg981Iwn4pvJb4r7vOhy1o3aUHur
	2k2ikdPMtLrYqG65wccohXUZEEm281UhiT2RIw0wBV8/F4ZPD4BekcTcXQpAVuwBivLoIoXTelg
	N2RGZL9
X-Received: by 2002:a05:600c:8b03:b0:483:c12b:fe4b with SMTP id 5b1f17b1804b1-483c12c002cmr31522165e9.9.1772038686018;
        Wed, 25 Feb 2026 08:58:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm29583655e9.2.2026.02.25.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:58:05 -0800 (PST)
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
 Re: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner
 A523 SoC
Date: Wed, 25 Feb 2026 17:58:04 +0100
Message-ID: <5968038.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260225160828.1687643-2-wens@kernel.org>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-2-wens@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7030-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D30119B2A8
X-Rspamd-Action: no action

Dne sreda, 25. februar 2026 ob 17:08:24 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Allwinner A523 SoC family features an identical LED controller as
> found on the A100.
>=20
> Add a SoC-specific compatible for it, with fallback to the A100 one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



