Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D492417BF46
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 14:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCFNko (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 08:40:44 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39254 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgCFNko (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 08:40:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so2407517wrn.6
        for <linux-leds@vger.kernel.org>; Fri, 06 Mar 2020 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=bdPhkW4UgZj3NgrTzClVcGk0ucj/Sl6PxWz82p4Td04=;
        b=ZozNv7vGVxYVaHhlgyAfMOB6hTszV7oK2Tolt6/VJ2+coLOnkKk5cPOQkhh9WQcdbW
         faebgVZuGUAUfXUnTHNTjHCmptJViOMvBZy8d0EwCxF25ZQ1geoefL43w7e6jUo0NEha
         oepg9brExAvPulvWLU8Olv6O9Hmqguluhl3HitC4CWnz5a238Cv7dMJcZLFNl8Em8vTR
         XWZA7KaoWJbsvHFwiA/KvoUuyDxshrY39+1qC8hg2WM/gs9mg/hgdleZ6P1Q0kfB22qi
         D0RGmaQVnnYTIYziblrbI2RRoQDUhs202hV7ZqXKb/ZXwjNusWOtUO/vP+N/+Intn3sD
         6/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bdPhkW4UgZj3NgrTzClVcGk0ucj/Sl6PxWz82p4Td04=;
        b=fChH1UUhK5QUCmlhrQdEYboYzT1hjboT431pD7kTrTUCVIYs5tp8Dp40CQsVUNwR9Z
         wChK858wEvo4hev9OAdllomJl9yPhfUqAVQYynoiNxvl6kY1IOS9qGMg49SlG3Tczy6e
         U+Cvp2i4dTVE/5eylQWpVrlKDpelHGdpGEaT8qmLGrk06UH22y7c8TgmeJTFeTD5qroP
         0QBl4dXXRJrD/TARKYOOjr7xBUPFcAkwODtZfwduFfbI1a6rPza06npzBiPfHn7wmXkT
         1NxeD91tMrCadKBCJ66iEp0RPsW9BAcQPq3e5hpv6L6Kp5AGr9Cr3/zNxlogT0jeYla2
         Y+Ig==
X-Gm-Message-State: ANhLgQ3Jkybbr0K9nIoKkoYcoJRXAC/gioxY6QWJlaGWtAc8CnxNA/JJ
        Nh1Vhm4dvkkn23O8CRvH8BZgsQ==
X-Google-Smtp-Source: ADFU+vudYHqKQvC/BtJg/zG5J7dcdZL5n5POqky7e5CKQ2FOMdjz++5DiGRK6sXplmxU5IwHQxFZyA==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr4366616wrq.301.1583502041532;
        Fri, 06 Mar 2020 05:40:41 -0800 (PST)
Received: from localhost.localdomain (89-82-119-43.abo.bbox.fr. [89.82.119.43])
        by smtp.gmail.com with ESMTPSA id g7sm47178086wrm.72.2020.03.06.05.40.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 05:40:40 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH v3 0/3] leds: add support for apa102c leds
Date:   Fri,  6 Mar 2020 14:40:07 +0100
Message-Id: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series adds the driver and its related documentation 
for the APA102C RGB Leds.

Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.

Patch 2 Documents the APA102C led driver.

Patch 3 contains the actual driver code and modifications in the Kconfig 
and the Makefile.

Updates since v1:
- Moved the apa102c line in the Makefile to the LED SPI Drivers part
- The driver is now based on the Multicolor Framework.

Updates since v2:
- The driver is now back to using the normal Led Framework.

Nicolas Belin (3):
  dt-bindings: Document shiji vendor-prefix
  dt-bindings: leds: Shiji Lighting APA102C LED
  drivers: leds: add support for apa102c leds

 .../devicetree/bindings/leds/leds-apa102c.yaml     |  97 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-apa102c.c                        | 306 +++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
 create mode 100644 drivers/leds/leds-apa102c.c

-- 
2.7.4

