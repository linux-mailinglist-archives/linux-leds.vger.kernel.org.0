Return-Path: <linux-leds+bounces-7999-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jmUuJY7/+WljHAMAu9opvQ
	(envelope-from <linux-leds+bounces-7999-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:32:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5454CF735
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F35483004F13
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D563793DC;
	Tue,  5 May 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAsz+C2b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D0377542
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991559; cv=none; b=XQtd4jRgAcdXClz/Y7Macz8ScX6Qft896PqvLj9adB6aCoY30T9BP/RqEnYluGA7ck2c4kpIKKf9zN7+xB6o1pySwPUvIQ0RW1J1zg8X11Ix+oz3AIGyZYrd2gKeB/mL/MuKdLflb8gDkQVuM0/lVX6Lo9UIDG2rNyYjqb8rzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991559; c=relaxed/simple;
	bh=FDHbGuhskbBYK9B3ZIhL8JMcMmvyjfLkUA3LYinKnrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swkXqrvKXPdtIFr12lBScKPC7dkZTEXKKZoycchkkShFtyGRcb4WmiFvt0vcDGbktQkTjpaJWsQNr/WQb6XAKL84+hQ0zV6Ul5JTPY06c1HA1O8+dIrENVHZOqUD2kQwYXavQ+hwlnrct5G+D4/6LpM5CsaXNtqrq2H781SXXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAsz+C2b; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so8068546eec.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777991556; x=1778596356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c88BAr8bO221fRKGDOrgPFzIl4l9xrFfjEQLmK4BdhM=;
        b=JAsz+C2bnaQanMnMgZkPtYQcRLIjFDR01mIkrNxBPD5T56XgbWbHqbAnnWfIGiOZEJ
         LVE4I4cLf050fLRUyl4fXfDlBqu84emJw0VBlFjFyhizfmBUDBPMVd9GlRc+xDo3Bk0C
         pDG4FiEOv1ZEmlFtoO4AQb35AJhEon0jV6HoXfXKJ03dZ7nLPpE54S/PBy6791OSN6vn
         YJr9Cf5GwjrKftGhiB25M9DABE3KkvcBuLGST++5XrPYEnRVdx4vOnlWYmPtLbOUgDmD
         oGNIH/mROxxCmTB2+xvpiSGPsaMlUpsUAFZ69dxgNWINw9cP2oDXSVooX0rg1Wuox2mO
         rRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991556; x=1778596356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c88BAr8bO221fRKGDOrgPFzIl4l9xrFfjEQLmK4BdhM=;
        b=Rwz295C6s3WWkOTUhkuEvbcYfjiJlD9a9Q41QxLmVmpwOvp6a6/QwOI/x6gBkeWOvc
         4L1jYLY+P8Yi+sO37+Vi9CCaiIqpKCcw2x30avYlKbP6GIN/r+gQHrRjniOWKxaF69UE
         GYNFStncplAlxOwj0bpZR4vHevJrnTKHINmfzVije84r7IP4AUz4BXWZSvG9uxLR3OcS
         Jndu6X2PfUbi5Dm7dFn/TWbDvCMc36g/fp4b/iNFos6bWvVlGJKAMj1nZgYCkRlPKh/j
         xbES4/a3JOpU9GYUnW0bu7nVFHJt4V/Omu+RWPiS374U9AnempupEbi4rk2Xtb0AeuQP
         9Eaw==
X-Forwarded-Encrypted: i=1; AFNElJ8UK1HktfbjCgXd2ddjYPPzzRPvNiHvjC70eTKdyCQMUcUApuXta0ZOlrSrt5DbgG3KncAc0NOWPBTD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyajd/+pxF9GTEcLWRioxwNolj9huzM/JePOqZYc4VERhM/Gwb5
	GpETCQe9ik+8o6rggHLDggx867P6xHpDsP69Yftng5+bAYLltLkOrwRE
X-Gm-Gg: AeBDieu+iTtCCyDmVVjDNChhM88YfVoynRxPayYrprhzpaf7zA5FrKAk9zq2mskwDFz
	rAhpWA0/9lg/XC74XtSLLJvcDyC86YlvrWutWZxMvW9AgspSMeFxJxlrS7KKxkR1zt566tGBoYS
	P6wjUDkLUvQUpp/wvzFh5em0pMao2wbzU6Wcp3zzj2cv1cKCZ8P3F67yiX/SRf9+6TaI3ZqMti/
	PI4cqrwmkdAEiXucIgKm4LMlA4NvgM8cqY/mHgApE+c2pKLd7BPJnLLHQCLvhKSMp6CFYGV7VZe
	IQhIP3e2G/fPW7LMs8RKqUrONu1zCydeFHNsH0QpN0AbUh5Q1ADrqGdk1uBCaQpC7wydp0suBh5
	L9ii+l968YxVd9kk+YM9yQWEtcLkUVnLMZ1KTcSX2wmFnTo9Zd/KzZ99JVI42Dy1R++Y910gEDv
	VX+YXhbxeQjJ0cvXhj/QbaTSsSdzOaGSY=
X-Received: by 2002:a05:7300:d0f:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2efba5a7783mr6780606eec.27.1777991555590;
        Tue, 05 May 2026 07:32:35 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b11fsm20803843eec.19.2026.05.05.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:32:35 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	daniel@zonque.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	robh@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue,  5 May 2026 22:32:27 +0800
Message-ID: <20260505143227.1263876-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b50cbdf4-a101-4ec5-8767-b62dcdb7d1e9@kernel.org>
References: <b50cbdf4-a101-4ec5-8767-b62dcdb7d1e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5A5454CF735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,zonque.org,vger.kernel.org,gmail.com,thegoodpenguin.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7999-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.995];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

> On 28/04/2026 04:33, Jun Yan wrote:
> > The IS31FL32XX series features an SDB shutdown pin.
> > Driving it low (active low) places the chip into hardware shutdown mode
> > for power saving, while all register contents are preserved
> > and registers are not reset.
> > 
> > Add shutdown-gpios property to describe the GPIO connected to the
> > SDB pin of IS31FL32XX series LED controllers.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > index 25ce67940c88..4654aa07dc63 100644
> > --- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > +++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > @@ -45,6 +45,15 @@ properties:
> >        When present, the chip's PWM will operate at ~22kHz as opposed
> >        to ~3kHz to move the operating frequency out of the audible range.
> >  
> > +  shutdown-gpios:
> 
> powerdown-gpios (see gpio-consumer-common)

Thanks for the reminder.This has already been implemented in v3. 
Sorry for the late reply.

>
> > +    maxItems: 1
> 
> 
> 
> Best regards,
> Krzysztof


