Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56186480B60
	for <lists+linux-leds@lfdr.de>; Tue, 28 Dec 2021 17:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbhL1Qjh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Dec 2021 11:39:37 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49164
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236040AbhL1Qjh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Dec 2021 11:39:37 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 515A03FFD0
        for <linux-leds@vger.kernel.org>; Tue, 28 Dec 2021 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640709575;
        bh=HGuU3G/CmacYFKUeANclkwpOH3maXtk12cKoz5IJaT0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=oxxN6eSWF7AXk4UAgg/175iDP8hmfpEDN1ZnkOItg3GnAAV8mg/Y7D7sOPyrjzRcC
         6m2XhJuKSYgwRwLLWIf+JbP4BVs/31EIC9Cn1ut+1WkTN6RrtLdfnnASUGcl1omKmN
         HDGk97b8wIj0V5RoFUY0kipcX61vKZjCnvNU5EAdxH8ErPQxZAX1dB2BZuHK74W18i
         w3+YVLp9WgODqPwAdS3pemiG25UpeceDqBDmJl2uJ4JkhJhXVwUXaDCuw5yQFB1+FJ
         4daaf9eTSGy0o9bZd/+fNE+sa+2quqmfuBpMXqbhFphcInc06uPdnUOeKGQr5v2Lwf
         dfeOkC/jDeElQ==
Received: by mail-lj1-f199.google.com with SMTP id bd7-20020a05651c168700b0022d71e1839bso6211311ljb.9
        for <linux-leds@vger.kernel.org>; Tue, 28 Dec 2021 08:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HGuU3G/CmacYFKUeANclkwpOH3maXtk12cKoz5IJaT0=;
        b=0xEs0WkpK5akZCrSQPGgtrrcvGBddly3eX/ePqRSJQyk0Vw6dKJSXiv874tfoQHYa9
         cy/G01QQvbRQNbXMvkj7jhgqa4HB36+NuYFiSwjvSMDhWcS8idmxfGDhm+WpZQlYttLg
         DjeDtMRMu/c+min30CURSaUaUTaUKGz5FBTFp3JaN7cFlEXJaM+I3pLXN7EwJ/H3fG9Z
         J8RHnp25HuVGy3fELJwEvck5lYPPDryhGtd9TcXMQyCXlY2EoHbx4Bjm2UnoNRSAzWIq
         b4F6/QFV3IK5hr3U6I/GIVQbI5IXEv4sGMO7M6RsVqU/l2WGykzG8E8atUONc4ipYrSS
         me4g==
X-Gm-Message-State: AOAM531a6gvxwxmdSwq5Fxo1Qg2WJnlij8ZqbZrTILur6uYS0yfx66wp
        DKJIGhIP1bm8eDx3oLe8ivAVxLEEENwBCNnCYTCyxzOua0a0kAL5P3XbJL7nLNnyG8552Qg4wsV
        MZIz15hPlj9vtCZYph//yeFuZD6Up/yeID+/+MxE=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr12168952ljk.22.1640709574631;
        Tue, 28 Dec 2021 08:39:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2R4OjcmDuYU5dFgZyIsJA+br3TJLYbRM0hsPoVHlotH5EqETNcXzL7aQK6WUoOnCtKUrTgQ==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr12168917ljk.22.1640709574002;
        Tue, 28 Dec 2021 08:39:34 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d3sm1972876lfs.204.2021.12.28.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 08:39:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH 0/4] leds/power/regulator/mfd: dt-bindings: maxim,max77693: convert to dtschema
Date:   Tue, 28 Dec 2021 17:39:26 +0100
Message-Id: <20211228163930.35524-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

The final patch - MFD maxim,max77693 bindings conversion - depends on
all previous. Therefore this could go via Rob's or Lee's trees.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: leds: maxim,max77693: convert to dtschema
  dt-bindings: power: supply: maxim,max77693: convert to dtschema
  regulator: dt-bindings: maxim,max77693: convert to dtschema
  dt-bindings: mfd: maxim,max77693: convert to dtschema

 .../bindings/leds/maxim,max77693.yaml         | 105 ++++++++++
 .../devicetree/bindings/mfd/max77693.txt      | 194 ------------------
 .../bindings/mfd/maxim,max77693.yaml          | 139 +++++++++++++
 .../bindings/power/supply/maxim,max77693.yaml |  70 +++++++
 .../bindings/regulator/maxim,max77693.yaml    |  49 +++++
 MAINTAINERS                                   |   3 +-
 6 files changed, 365 insertions(+), 195 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/maxim,max77693.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77693.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77693.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77693.yaml

-- 
2.32.0

