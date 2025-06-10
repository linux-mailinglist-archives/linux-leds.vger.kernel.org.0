Return-Path: <linux-leds+bounces-4771-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D4AD3543
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 13:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5660417587A
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A7C28D854;
	Tue, 10 Jun 2025 11:43:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACAB226D07;
	Tue, 10 Jun 2025 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555838; cv=pass; b=AZoeTnYbCL6wWX2SchVdC4z15Ftb41ziYItAvWoYL9PlCdvv33K/zg1RNaK1Qib8BDZrIL0drMUZiUmrDkgEikmorVplCEjZL9cgH+PioBXeEtaHZoj5vmU+L4B/1eh4KVZ6Ib+j1z//bSEzN4EaIwHxzpDqP2wkZLImlUCp3Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555838; c=relaxed/simple;
	bh=uiITjteoxkaeAuq1hjBPppcndqOMCUH+QZXMDGdZR/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lU5NEzHWKV1EdTbhSqp+0yYBrwFofiVzCw+lKKh2Za+Nm5Si4in+9qNENk67Ww5D35V2Ut57f9QIdHIcS8oy+KCIqobvO/Qt21Nuq+j61KneWjSSAFVEsNDK3yv9ntwZ9xjSeCZ1SPkW/rVsCEaZJFT39pIdVUd5qKJChDHm+eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1749555645; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GSJbHVVXfiFocmAbCNc1BiCOuG4pSUxEwOCWR/uVL71ziE0ixT8c/+9su8PLV7XTW0
    7ZkXy5ZSxj+rfd66IvWPo0JkdEg3fP6xdlVmPrxQH//XDnQazN0wnkiE2aD4wzf/8dFu
    PWXefsScr/A5m1CCJY7vRBuMBCWZ0fFesR1eLqq9zhGNL7029TpXLodkRNsbILPX0KYE
    NdMfYvAKTfL3+pGF7wC/ICWNNVDLk2j29tblnfbncolM+XttLYhFQKe5eZVSNPOUaBsU
    lmZtPVA4vfLSd4otyt8wafRFjMmqt8ta5EKGqjmdV7/HR5t+Rop7mTFkEnIlF/GCJjYV
    ECCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749555645;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=z0j/rSmihpzXd5aYpATr1YjCDRitMRewVaq3O4GQK0s=;
    b=BiiLCWt0GlVQcoXb3URwJBXtNaq6dvf3vjjOHg9vore3uKqwZrC7bTXFlsp+0+UzYr
    vV7mDRis437K46lOFJZ2U49WJ1SU4+7odAUqNqCz9AwpHZLBuymtGZrvN0iVHP1v13l7
    zrRHxSBAFG01l9amzjPvbbeeJUoDj059BpwDV5BExgZl6loPXXKFyqdo65r66skAucRI
    Nou2/K6p64TGY0jYTQa8YpVYBpuAilFeZXucoia76km/zMYFr/M/3geIlB3+EIxLhljE
    uCp19/0flSLexIs85UDOIFvoTUoSAwBKRyhioPXlVtpmDhtvm+PiyE3LoKONImK8A5SZ
    iRSg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d715ABej5yY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 13:40:45 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH 0/2]  leds: trigger: netdev: refactor event handling
Date: Tue, 10 Jun 2025 13:40:18 +0200
Message-ID: <20250610114029.268938-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

This series fixes issues in the netdev event handling code which lead to
erroneous netdev associations if e.g. net devices in different net
namespaces have the same name before or after being renamed.

The series based on different previous approaches:
- https://lore.kernel.org/linux-leds/20250401085002.492904-1-tobias.junghans@inhub.de/
- https://lore.kernel.org/linux-leds/20250425132059.393144-1-tobias.junghans@inhub.de/

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>

---
Tobias Junghans (2):
  leds: trigger: netdev: separate event checks
  leds: trigger: netdev: refactor netdev_event_requires_handling()

 drivers/leds/trigger/ledtrig-netdev.c | 38 +++++++++++++++++++++------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.43.0


