Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0148B4B1
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 18:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344915AbiAKRzL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 12:55:11 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33232
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344943AbiAKRzK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Jan 2022 12:55:10 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 677453F198
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923708;
        bh=MXsYytzAABY4HKK+ZaE5lkaiim6ptvOjmrZF4BheVi0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=W/s9h/lndVErYU879a+fQuPCDBeFIG+Kos1aJHtAzDDYRwYz71yS0r1rh/cW8Y8GF
         0Mi9B1eev0CTMAz2tsPnwjFA64qkWK5kiQzZCzsYRHsTHY1eUW2yR15tcUfQEnnzSH
         Uzj32FGltAiqF6VjAj6Y8z+wbJ8ZWW2Nn2L61MheSlaaKjUCg1i0POxMrbVPqFARBE
         xD5z+wJMxKQkRT7ogG6+gWnn7KVFUWVBsU5Yi5hmJ4Kp2sWXtVvvpAiR/kqNHbIfR4
         H07sWO7KrBgl5+O9ufMBUMOE3dZqioZCrlmf6lRFu27NlqrWbieloKylF2iTBecfL2
         oPatARE89bpLg==
Received: by mail-ed1-f70.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso14024848edc.23
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 09:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MXsYytzAABY4HKK+ZaE5lkaiim6ptvOjmrZF4BheVi0=;
        b=cd+rW51PoGmvUktEIh2pPF1KV0f3ODWIjQwOWe3hOPXtxdATT0K4/T8cYU/iATSqEk
         mkv6ktYWKFvltgVUUQ3rr2kg5/8Xb6DIk88S2W18oPo7C6BLENPia83VFRPNGEDIitGl
         W0aV1X8iamqMnmSPTUKogd183Bexs9VnFsXmHQAiE3enSDhEMPI82Df/byvuAYLCw5oA
         FfX9hYh+l1KpN7Ww+4vQhzBXzZiZRLF1Q6XjvB3bzgJ5zD3Lz/iPCwzo1Efkv/UvQ0w4
         HPI1jK+6kgTQtPi57b2dg61gbusP8xpxjY8tDWWCElzX5jKTF58g20s1T39rhZe7mPpU
         78RQ==
X-Gm-Message-State: AOAM532stUFTNhN9nVzVCSYnmthvjXv5Io48cWMfLHt2QaHxQ3AjRtSc
        e+bAAek8B4OizdwAGhCWjGjbPxP0nYiOfjwCPnnXhoKuv1+7pgrvLag60iEmyHdTX95DXhwmK0a
        t8Zj1ErAoa+v4bOGD8jpzg94J4ELdSA9+74EtvVs=
X-Received: by 2002:a17:907:da3:: with SMTP id go35mr4667064ejc.637.1641923708044;
        Tue, 11 Jan 2022 09:55:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQBFDU5ou5YaLfXjApHtBvVBn9VtZmRG1DaCgihryHH4BeQZoYni3qG0a8Z/EALX5wpdM2iQ==
X-Received: by 2002:a17:907:da3:: with SMTP id go35mr4667055ejc.637.1641923707878;
        Tue, 11 Jan 2022 09:55:07 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm3759949ejh.161.2022.01.11.09.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:55:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] regulator/mfd: dt-bindings: maxim,max77802: convert to dtschema
Date:   Tue, 11 Jan 2022 18:54:27 +0100
Message-Id: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Changes since v1
================
1. MFD: Use absolute path to schemas.
2. Regulator: skip properties.

Dependencies
============
1. DTS patch: nothing depends on it, sending here so Rob's automatic
   checker won't complain about DTS.
   I will take it via Samsung SoC tree.

2. Final MFD patch depends on regulator, so the two last patches could
   go via Rob's, Mark's or Lee's trees.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  regulator: dt-bindings: maxim,max77802: convert to dtschema
  dt-bindings: mfd: maxim,max77802: convert to dtschema
  dt-bindings: leds: common: fix unit address in max77693 example

 .../devicetree/bindings/leds/common.yaml      |   9 +-
 .../devicetree/bindings/mfd/max77802.txt      |  25 ---
 .../bindings/mfd/maxim,max77802.yaml          | 194 ++++++++++++++++++
 .../bindings/regulator/max77802.txt           | 111 ----------
 .../bindings/regulator/maxim,max77802.yaml    |  97 +++++++++
 MAINTAINERS                                   |   2 +-
 6 files changed, 299 insertions(+), 139 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77802.yaml

-- 
2.32.0

