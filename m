Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2708AB0289
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 19:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfIKRV3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 13:21:29 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:45194 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729130AbfIKRV3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Sep 2019 13:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LQxw/u540K2TPFsuUGW/nsJsLYCtpA6SW4wjQ2RiCn4=; b=Enw8fEVpNTlLP3CEbfW/3P9zv7
        q6ZAWTnc0G0NtMPIWDXHVUSl5TYA2UAZbpLvdUBpVN2QBgr22U+sVuFtpzUJRScehYULw5zunqHgW
        FvRUUiBY1bq1tpy/XM6ndBlK6ORNyaGPgXv7qV6fnFBFE0X+FT36SFVXY9LwLOUq6Dvc=;
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i86It-0006kA-J3; Wed, 11 Sep 2019 19:21:15 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i86It-0003Lz-0Q; Wed, 11 Sep 2019 19:21:15 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/2] backlight_lm3630a: add enable_gpios property
Date:   Wed, 11 Sep 2019 19:21:04 +0200
Message-Id: <20190911172106.12843-1-andreas@kemnade.info>
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

Changes in v3:
added acked-by
removed legacy include

Andreas Kemnade (2):
  dt-bindings: backlight: lm3630a: add enable_gpios
  backlight: lm3630a: add an enable gpio for the HWEN pin

 .../bindings/leds/backlight/lm3630a-backlight.yaml       | 5 +++++
 drivers/video/backlight/lm3630a_bl.c                     | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.20.1

