Return-Path: <linux-leds+bounces-7754-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG0OB74c4mlX1wAAu9opvQ
	(envelope-from <linux-leds+bounces-7754-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:42:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D247B41ADE2
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4666630164A8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E54397680;
	Fri, 17 Apr 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyGwe4Sw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC43939DB
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426168; cv=none; b=kr+A/PNvRPTrfWEgreI7HAoyGHwl/ltm4o3f/+ZV7nS9p68BpMFH6y/rhMLOy0eQ0KrH6qFA/PveqTivDCApoZSx4A2Wv/X75KRaEs/yTZ5r05qJq2OAhj2mY8bq12LplGggYTaGNRS7Hoi2AJrYrrfc6anCcMVqDonYYpVFmUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426168; c=relaxed/simple;
	bh=m6BsFNYPJXLrBc7M3UqW63oYvoO7GXOCslzkSLEcFco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3heMQllerw8d+avPt5ssMYbWwvw3v4Ig345fwALDK7C8xmPvhTjXo54JSH0TA81btt4xAUGp6X01YK1exMllMyjgwfhId+yXRp4V8QvDagkZ1c2wXuhu8kEgt7kzyP25kdq7zN1SmO1XBhsKbx03ex3C4VJYZNUDZ9kjcDRlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyGwe4Sw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so705189e87.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426165; x=1777030965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=EyGwe4Sw4bBq+wMZYeu/VWXhlarSvOzzDwAYF5IPsCAyZ7rB+YR1Z8p6KRoeVDEQec
         8Z5ak0MKUgqVtHuLx5Ke8Kj75e72qgTl4mJwvsvIvC0BfQTzkvkQVGtwCTyC4j+OdNkB
         kT7bxH0fji7uSjvXE7xfDnpnBjIorYpHwQ+UzdPsUfClHFrQDySt5tOhtnd0YHQ8/FoR
         9NMjBK3hDz/DbqEx1fBkEqJqGpy+i02L+W3NQZN/2QG1K7J69POjQ5M4mr+11C7AXoEg
         0BgyV6C9XVm9bt3Qxw+kOkyrjemx+5lJSdulLhJ9X3SSX3jDXSOWMeDtlzt3hDpw+WGv
         XBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426165; x=1777030965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=KuuTsjgFQipJDLt2xa9D291CsT79obvmjr0hxFQBC0y7VspWpjvjRBdHq+XMMG8Hx4
         nTiiLKJIPfavc/1Fs+Bcneo4ZHIErfAfvN/7gX5zMNjSIK3jzmfKvEm5ixp8Faf7VXqk
         Lrq+drkbSVs/pP3prmfqFaKspDjm08J67/0WUtqorkD2Fkn8Y369GOrjKNpg2z9xgv3K
         Pd0sFw7UueFucH/IAYnxx3kAGk40kPzodVh6wKEsF7HjEFx9EPVbzQu9pXh9nWTe8seu
         YU65v6H6POUllq+dLji1sANhx5aChLgOANLvxSUUNoa4Hl0Yh1FQUv8eTMg0ipSx+EQK
         hbug==
X-Gm-Message-State: AOJu0YwCzcwahEzma/iVikl1Ub8oh2+TXs2K7m+DbP+kBWlGEJGg7o5l
	fIkEIkP0aNX/zBbS7He2U18OclXsLviDp6y/g6gCv6f76cLFjsGeTXu4
X-Gm-Gg: AeBDieu4/DYlGCCpSmitvJB6bzC3FgO3LxwJ+Z5Y80QTpZdkzo1buHp2PV9rTmC9FWG
	N3PB90Ww9IRAKVLN+NnZ/7+4ovmFMMkFhtklVJpA99yOMQ1SjT0pekUXIQViFZ5yYK9oNYBRa5K
	S2p3KjRrjjEW9TNxbFX1YgyM54cqpg6i0YfSROe58JtuwvD++PVWzLDXzpYJlF7qSYCkEp+52lL
	xrS4gUA+BgoW6VZVBY6rZVP3G52a/5IQOI8QXZ1FLErjoqCOx3uICAdwht6kqkOYVDC+S3tBOQV
	KLvDsGTi9FbILic1xgIm2rktDLJ5/9eQ3VNvl/+duZ98wK3o31k5gIyumjEMsCUIsHq4fj2kxKA
	neiVr4eNyzhjQ9TLMUa+P5lxvEhsdrVcasjw8RH0EPkUoy8hL0cLYcQXdmY7Ik/cWI8BKl+bjuO
	qlDnJB8y5fZCtnf2W7uhQLPtc=
X-Received: by 2002:a05:6512:31d6:b0:5a3:f309:47e4 with SMTP id 2adb3069b0e04-5a4172eeb12mr744644e87.32.1776426164792;
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 17 Apr 2026 14:42:21 +0300
Message-ID: <20260417114226.100033-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7754-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D247B41ADE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

Svyatoslav Ryhel (5):
  media: lm3560: Add HWEN pin support
  media: lm3560: Add IN supply support
  media: lm3560: Fix v4l2 subdev registration
  media: lm3560: convert to use OF bindings
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 +++++++++++++++++
 drivers/media/i2c/lm3560.c                    | 139 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 243 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


