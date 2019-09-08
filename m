Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 927A3AD0BE
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 23:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730526AbfIHVRl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 17:17:41 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:37340 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbfIHVRl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 17:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WLNvj34w1pMydEMVCJGWGNCq90dYkz0edkv/6Infxco=; b=gWNUGaQHNjgOqY5zrZ+BPjNJ/t
        nXKXYK8g5xv+b4o4OJ7PoWuZ4TdtVR+ADL8078ghBlGq5JIn7GX3YYYNPdBCd8dnAgS+fOnizKSk0
        HOxJnNH3asiCrxW4OycyeZrRHWupr6FrA8586BBGINUZMWm25lwruT06eEB7eCFMQRMY=;
Received: from p200300ccff4729001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff47:2900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i73vn-0000wL-Aw; Sun, 08 Sep 2019 22:37:07 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i73vm-0007rN-W2; Sun, 08 Sep 2019 22:37:07 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] backlight_lm3630a: add enable_gpios property
Date:   Sun,  8 Sep 2019 22:37:02 +0200
Message-Id: <20190908203704.30147-1-andreas@kemnade.info>
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

Tested on Kobo Clara HD

Andreas Kemnade (2):
  backlight: lm3630a: add an enable gpio for the HWEN pin
  dt-bindings: backlight: lm3630a: add enable_gpios

 .../leds/backlight/lm3630a-backlight.yaml      |  4 ++++
 drivers/video/backlight/lm3630a_bl.c           | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.20.1

