Return-Path: <linux-leds+bounces-7308-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKNSK04asmmpIgAAu9opvQ
	(envelope-from <linux-leds+bounces-7308-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:42 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23A26BFA1
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4172730240BA
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 01:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E87D373BE5;
	Thu, 12 Mar 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNdpNF6b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8A23EAB0
	for <linux-leds@vger.kernel.org>; Thu, 12 Mar 2026 01:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773279816; cv=none; b=Ib/37REetDEYmzZkb2w1845fcNEBS3eZLW29F7cpB0h8GHyAr+54fGabX/85ouJepajuua+8KRg4NhmmvjckdHQ9jNenDmlATIl8b9sHotd9C8bq3HRtpjWFzkmFx+7r5TkwxaAfSJlx794Z7tfBEDq4dadh4nj6hgbgsbzy7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773279816; c=relaxed/simple;
	bh=2G3EwYDykZE+Wc23axeFDpw9UC31SPemRxkoSgYs8ro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BtObog6biob90pchHhjCTfM9yEA4+a373rY2h0z8xbte2LAKXaQvatjOAuh54FyBOolnTpMgLcdhXwcjMoNWZ5mm/i7JAUtv7fueMHSlAuIyq/v3bDLjqGB/0Ef5+oTIWcTVmKZFVkS3RGpVE7fsgmUzRkIKwIIHEDBTz12agrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNdpNF6b; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127380532eeso315515c88.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773279814; x=1773884614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9BiCutWMo2iXMSzIBcHE0Q7j/bcvH4uRlsGlhLrJlQ=;
        b=PNdpNF6byQeDagzqDlQDbH2LEF7zE2XywzOsuFRYN2Gam4Lqy16FL7eh59cyu4FgiY
         yiIGTvdVWUAloqxbzIp8KzXZVfHy1lqf7DmJB2yHZTCfZqKKPaBsANyQUeaXgL5r0N1I
         zBbadTOcN5HvSYaFrC4Hdeg+d/rkBQgbCzAYAvQVrpfD1WnFI5k5M9U3rHF+ZbzV/Bz1
         1pEUzSiWx0NKvgC7zus2vkD/BjOjn4pjr+93Py4vcBueWsweBuI6ZJiaaxNvI1sXi/ke
         T7DbdDx7N2NloY9JKw8AeszwzsT8aEzmoYeGYw7/Dj2rgq0ek8JGasV5n4Jl2aRuHlO+
         I/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773279814; x=1773884614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9BiCutWMo2iXMSzIBcHE0Q7j/bcvH4uRlsGlhLrJlQ=;
        b=UNpsPiEi7+l3DzYcsgIO+FPnMDL7ujWktZmr4S4jKNqL5JQ+2pg6A5iRjyQxlbBWff
         QEHB6cm+TXsyjKEhbuWigKyRnYjl/l6/FBJ8pkouficwTFdiErLiVhS44FjGCsEc1B7U
         /S1CQplHH5qbRlyf7x706WM/YsgjR0ULYG8QdsdyqGFYbNRNgoxcNf50Sm1QGRrOj9K6
         t25mbalJqaQYas5hJpJ4uz+pCLvUEEtGQz4X9QDauNx8Naxk3J9m7vyCRlDQjsdJIDl9
         I9j8n9Idr/ezHJTCq+M87QkORxen2RhEsnHiWyYDXE0fEnzRgKaqei5lKtEG8YOfPTA2
         qSjw==
X-Gm-Message-State: AOJu0YwxARJkrzpxWRyHs/XGTgPOcdZ/rCyJlPCt0eukvIB/pvoeAle1
	WACRwV4K8dqAZ3mc1QIkBto7J5/KOM58Kni6FnSEEm2rI35UhIVM86lFN6JwCA==
X-Gm-Gg: ATEYQzzlMmc9klM8LTKiv9SIyAMTQMlhi/iQ/FnsSGHmebowUP+yO3jDoAOmaQC2oXr
	KZtupzAZvsrddkVFz9VdXzu2pdjd8pqo0ERrt7lfsuJjt3a0F0bk8iBJhZwa7C8WXu5kn/oVg0O
	NmmaXSVLhZpIoB+3mQMig8MOaFpBkbvz3gKLtsniP2IgUXRKFNZ4tZ6jDsffp48GSj/RPk7IF3t
	E/VESosZDUr2KwwyQnaL3ZEGHiUOhVxHsPgbn5RSmeBf3NQ3TlDlNdEiCgXSxkC2Lf60bW33B5Z
	kr2j4mee71ZwGekkx9C3CmTTmw0TzalxJRiirbZcg76QmsCCCo228y34dr4h+BZvh0IT7XkTLRb
	chjfAJxxltT96Zw1EzcJkb/7ZTpHFpex6Pc5aN9WHR+ma2DTas9/bTOOEoZciq7/a9RtUToOlxy
	oUxoQpDNx3ZU1Dz6/Ud0wHA4ae8uLhtPygS5/1go2Pr/pxZuyN3Li4T9pvvOOOup1+fye0Hyyad
	bc3Go81lWU2oXs=
X-Received: by 2002:a05:7022:619d:b0:128:ceac:6db3 with SMTP id a92af1059eb24-128e7878dc7mr2210526c88.45.1773279814073;
        Wed, 11 Mar 2026 18:43:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:53e0:5b17:5211:b0f4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c0d698sm6619016c88.6.2026.03.11.18.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:43:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/2] Fall back to using software node name as LED name
Date: Wed, 11 Mar 2026 18:43:26 -0700
Message-Id: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4asmkC/x3MQQqAIBBG4avErBtQw4SuEi0q/2qgLBQqiO6et
 PwW7z2UEAWJmuKhiFOS7CFDlwWNSx9msPhsMsrUqtKaV3hOV9g9OPQbuPaDgXXWKacpV0fEJPd
 /bLv3/QBUwGo2YQAAAA==
X-Change-ID: 20260311-led-swnode-name-6db2e5757071
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7308-lists,linux-leds=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 3D23A26BFA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This allows setting just name in software node representing an LED
instance and forego "label" or other properties needed to form a name.
This is helpful when converting old boards using bespoke platform data
to software nodes/static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      leds: core: implement fallback to software node name for LED names
      leds: core: fix formatting issues

 drivers/leds/led-core.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-led-swnode-name-6db2e5757071

Thanks.

-- 
Dmitry


