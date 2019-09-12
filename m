Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BE6B15E0
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 23:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfILVdu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 17:33:50 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:52328 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728679AbfILVdt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Sep 2019 17:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ojikyP8DDDZht6MCI3yymMMHVNO3MHdZIWJlDeI920E=; b=TaJ+XvsFaOcfMv6INNBtKM3s+z
        VtG/EVb9hsoJUJU5JGEi7DYPxbI10za9P1tUM3uYuGeTcZeGTEj0HPuF/XpnHo43hOXXqACN4ZxAF
        ZCW5bdbAs3GAB0BD8Ya62vGi/wNC9t0udMttfrheMDaWpV5hh0eYq2IX9ak9AuL2we1s=;
Received: from p200300ccff1554001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff15:5400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i8Wig-0006RM-H3; Thu, 12 Sep 2019 23:33:38 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i8Wig-0006Jl-5j; Thu, 12 Sep 2019 23:33:38 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/2] backlight_lm3630a: add enable_gpios property
Date:   Thu, 12 Sep 2019 23:32:55 +0200
Message-Id: <20190912213257.24147-1-andreas@kemnade.info>
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

Changes in v4:
added reviewed-by
moved gpio to the right position in the bindings example

Andreas Kemnade (2):
  dt-bindings: backlight: lm3630a: add enable_gpios
  backlight: lm3630a: add an enable gpio for the HWEN pin

 .../bindings/leds/backlight/lm3630a-backlight.yaml       | 5 +++++
 drivers/video/backlight/lm3630a_bl.c                     | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.20.1

