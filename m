Return-Path: <linux-leds+bounces-3960-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA59A33451
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 01:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF5E3A7D03
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 00:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B80B78F49;
	Thu, 13 Feb 2025 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="1JrbaSRy"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018C78C9C
	for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2025 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739408332; cv=none; b=ozR39qBQ9DRMFB/5TUJPSkNvmpIvEOJrOJc2G+KikvO7RXvpJKuwTrOBb/d5ci3uA60SHfK8NUr2GvuBuc0Zh4Uk8YhWpJzylXj9wMb98zZ9bYLqx8BP8nRnWIvz1CAt9M3hdJriPodM84f2nRreO6EBlo0VE/DRCh0XLy05BTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739408332; c=relaxed/simple;
	bh=xANtEQ9//j1FX54ds63WISvA+oxNjoSzx5cqV37pGQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGrzRGT5FfRGXjmTUXSJnJYxxJOEOXra4SoThw4rPKEIXInvELX/wW6cqvkOOgBeCPx+MjfQWEhI0+le734KeJrym4Hebb4Cs8xk8tmNLKp2UiiG4sv4v0HiBhQqOQc7Exgsm7YFKoUM4Py4HVVx4rsmh/WQv/GEqRpjqqAQYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=1JrbaSRy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7D52D2C0380;
	Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739408321;
	bh=TXI9pMpixGS7J/tUdlHzvvo6TNi4WW9swt5bx5YIpNA=;
	h=From:To:Cc:Subject:Date:From;
	b=1JrbaSRyDU/8NnqIx3sJCYQTVutpOZTMSp/rXRv+V2QQNbH2feckniJI17Mv3oVP6
	 LAi9Nm3LFQZn7rEtpG8nDPH97X0538b5yv4KflGSgBtPirLihuIRWOBuDmYa3cqba3
	 fR2jKTxCQ2BQy7zq49nVFINhYJ3pwixPgZQYfAq68ItQyAMWHAv85ZSWQETHOqnHfR
	 PjveiArhb17pFmBxOo3zOlMPv3IKRk0unCY3NOHFwKYZxpcZJ+U+JnvOV4q7RHkdb/
	 djAod/Op2OTOoOE5bFaxlH0NlguCkvSHkPBZEPlZ95M79DuJlqbhORDXOdS3Vf11lQ
	 0u5HwjWVobpZA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67ad43c10000>; Thu, 13 Feb 2025 13:58:41 +1300
Received: from tonyo-dl.ws.atlnz.lc (tonyo-dl.ws.atlnz.lc [10.33.12.25])
	by pat.atlnz.lc (Postfix) with ESMTP id 4FDC713ED2A;
	Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
Received: by tonyo-dl.ws.atlnz.lc (Postfix, from userid 1161)
	id 489155A00AB; Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Add function define for PoE
Date: Thu, 13 Feb 2025 13:58:40 +1300
Message-ID: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67ad43c1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=FVDT_2vcuJ2hx8SygK8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

A network device with Power over Ethernet (PoE) that is a Power Sourcing
Equipment (PSE) can have an LED per port showing the PoE status of the
port.

Tony O'Brien (1):
  dt-bindings:leds: Add function define for POE

 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

--=20
2.48.1


