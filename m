Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C838FAF291
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 23:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfIJV30 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 17:29:26 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:49820 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfIJV30 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Sep 2019 17:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xcg8PAW6M2blaLHjGv+8B+4Y3q8SjsFw7wRNh6L6zik=; b=UoVv0ryYF7R4K8jEIuCSAsrqXH
        Iju2/vSh7ahNGK2uVpKYuL5s/mmoQ2O3WHtAEEDCcQ5OwHJ24ox3iae2CGYB6IA8WabONRdHXI144
        zuWwVVFdD7CjZmByfnj5Ii0iO0ItMMwLuNFnbt9ZW1hmy5ivzkJiCov/5fNQC07tRlaY=;
Received: from p200300ccff17ef001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff17:ef00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i7nhJ-0001iA-QI; Tue, 10 Sep 2019 23:29:14 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i7nhJ-0004ig-C2; Tue, 10 Sep 2019 23:29:13 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/2] backlight_lm3630a: add enable_gpios property
Date:   Tue, 10 Sep 2019 23:29:07 +0200
Message-Id: <20190910212909.18095-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

To be able to handle the HWEN pin of the lm3630a, add
an enable gpio to the driver and a property.

Tested on Kobo Clara HD.

Changes in v2:
simplification and reordering

Andreas Kemnade (2):
  dt-bindings: backlight: lm3630a: add enable_gpios
  backlight: lm3630a: add an enable gpio for the HWEN pin

 .../bindings/leds/backlight/lm3630a-backlight.yaml     |  5 +++++
 drivers/video/backlight/lm3630a_bl.c                   | 10 ++++++++++
 2 files changed, 15 insertions(+)

-- 
2.20.1

