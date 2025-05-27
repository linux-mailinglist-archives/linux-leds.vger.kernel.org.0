Return-Path: <linux-leds+bounces-4723-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EDAC48AE
	for <lists+linux-leds@lfdr.de>; Tue, 27 May 2025 08:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0853189BE15
	for <lists+linux-leds@lfdr.de>; Tue, 27 May 2025 06:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF471FBCA1;
	Tue, 27 May 2025 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWTA4Sy5"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79A1F8747
	for <linux-leds@vger.kernel.org>; Tue, 27 May 2025 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328894; cv=none; b=XiqYs/A8AWNO0zgt/Q28EJWX69cuqLGrVQQRyyVJF8JV+IVnL2JFpQdf7UHNf0pcVpyLvL4a8lCW//9zmHYhp7/AK3ljXgRZetVszev+T4d2+zYY+0YZu0XGheEdjUSMEU09YwZOC+fEZ092hsGr3qoKsh1hqASgiRHj8hwnrsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328894; c=relaxed/simple;
	bh=pueDU+2IVTTmzOG2Vomw35iAiyVvIagwvaJGKUbfBiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSfctngFSL/jVZ1fL2M/lu/OHEEOpLU58DT5wE63lTCfmyFKRJfGAItHwZSFJjVfHa17TTpg2i+Uxi1K2sKK8MDkcgjndge09tyw2704Szi6GMPi3168rQsW38dzNiSMWVCOLvW5c1FRGOT4agHFRK4dj/kQQ5N2/2rCd7el3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWTA4Sy5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748328891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
	b=EWTA4Sy5jW7FA4kFoOECr3Ykn8Hh0j3EZnMIDtT+92liYFZrTOeQvG5lYQV+FRnJKpmY/M
	bofzqg+Gt1DXBKyvUpZWjXO/9CeFSdPBY2QU/v5CE39KbXGiYmGBFHgqFaadd5eqDPBUOO
	7tWcHm2SlyqKsNvvVmfv0Lpr+eFRfp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-1ZezRrzdOzSBRytHqIphuw-1; Tue, 27 May 2025 02:54:49 -0400
X-MC-Unique: 1ZezRrzdOzSBRytHqIphuw-1
X-Mimecast-MFC-AGG-ID: 1ZezRrzdOzSBRytHqIphuw_1748328889
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so17085685e9.0
        for <linux-leds@vger.kernel.org>; Mon, 26 May 2025 23:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328888; x=1748933688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
        b=BqHAYm6GBP0e46zh2iOJ0y0rTLzbI97OJ6ZW9KB7DVfMfsdyD1/Ob4MFjr3inUlX15
         3jwLPVrcZXNCnq5raKmf4DtqW1FWzHndAEPPRKeXAfsJa8l0XX+Lwt3JX2QFOBE2HZ8L
         VFog5tk2BEIzbDgKjlEf16AsmBE1sdqECgygoy122ZJr8dXYaPwKESKz8ficTrFTb22b
         GCeMsXd36WUhjoSE1Rw+KQ1rcnkTKOHPilXA6epreE+g0pESfha3HoJz+4Xm3QgvzUua
         veqXahO4pqF4JmP2S4/WvOIWMekOMiCYjiN1QhxfnW3iGJnpuZLI27lk2dEHPC8Dc5oG
         FXdg==
X-Forwarded-Encrypted: i=1; AJvYcCWFvgB04MTpX7PDv/fDrJBNJuioaiipwGTdKhuvJnv662CyjNQMWOVuQZVyKg4t5D3Y9ThJZReSU/RK@vger.kernel.org
X-Gm-Message-State: AOJu0YzEroH+ed8IJ+2RZeJxpb9JdUtwpW1s1XUhZK5/IcN8noW2w/6w
	lsar+5dd9AiMMeb64JlMD1b1ZJk7QVjmUzIuGw27CRiTp0XOiXtZkTxXVauIbuAdZjbqj7ZmFsC
	sMVKycN2+bHVLldJVsdgbPcHjff67QK529xxtOibOPmNDaXaL6uFN1Ez9AUe8jWc=
X-Gm-Gg: ASbGncuaBaGM6PPqEZBoDFwotTwne4IQkANKu9CV4MKW+4Ln3JsXjKUot6XlM7cPwvJ
	jjmJWu2BbOG+3QFZ1+v03UkbCenixvYb59bxoR7NPchJ9rDdDB+fDO7AYjQpkePlufoDqS+aDM1
	ICfLCjvJ4rAf4tmsTrLZnHN3cBTOVH7X4wnSjxHQZIFA/sMBB2G1v+8WcoQIp7LLrasGrTE+7CP
	w/E7KQnq9wOuY7NV6Y/6+PZq/lHq9vdTLiwfg5DH2AC/0knQuJJNcPi2lp0vdIOVAyxhmMMfpu0
	Zc/4euPg4MRCT8Ycf4q75fRnZeHUTJ3aaQCscv/HJkU17bIdIY7RY2PrNcA=
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543255e9.19.1748328888623;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvlq2u3HtOzGNrDrF6DdnIHv/xATBiGmzadzOCj185iZIcGz3tFT0jB+qadEvps/mZddgsA==
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543105e9.19.1748328888257;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm260066835e9.23.2025.05.26.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:54:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TPS6131X FLASH LED DRIVER
Date: Tue, 27 May 2025 08:54:34 +0200
Message-ID: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
Instruments TPS6131X flash LED driver") from the same patch series adds the
section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
referring to the file ti,tps6131x.yaml. Note the subtle difference between
the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
complains about a broken reference.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..0c4f0eb7f49c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24518,7 +24518,7 @@ TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
 M:	Matthias Fend <matthias.fend@emfend.at>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
+F:	Documentation/devicetree/bindings/leds/ti,tps61310.yaml
 F:	drivers/leds/flash/leds-tps6131x.c
 
 TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
-- 
2.49.0


