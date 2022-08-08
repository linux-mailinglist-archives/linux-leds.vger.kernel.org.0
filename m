Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E507258C6BA
	for <lists+linux-leds@lfdr.de>; Mon,  8 Aug 2022 12:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbiHHKrs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Aug 2022 06:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242198AbiHHKrr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Aug 2022 06:47:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D002BC6
        for <linux-leds@vger.kernel.org>; Mon,  8 Aug 2022 03:47:45 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id f20so12031532lfc.10
        for <linux-leds@vger.kernel.org>; Mon, 08 Aug 2022 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/fyxO5UUrefZ9S+J35611sMDpHuXmlRV0zDBtFzDOI=;
        b=QZmV3X54GBsXEmxf8s+h7eZi2Rxvs/eX19h95wNMagcOZG2BWqNyf/8uWSfXcXSi0H
         D2J52UwtV2GSgQFWuxXsNus9vThvcOJ+x4rWJngGAMleFBFuIYAI5rvU+Il7yr8ctY4T
         ZKaoTqZViE3AKz+HCKv1fFJIimhWLQHvetuyDAKU27eMoeyiFFrnREgMssyyOd/w2GQ+
         8ro3IxWKXCe5zjT5FVpqNvP8n6eT0XZXVZDl3kWSWyluVjCgUzT86z2/dNAwYityi6wq
         tmOAUw4lGusovZmiIyvBkv7UxmoTpR8kxI7MUaHqUlqx+lROUxJxkV2OFiZmJoQ7EpYE
         HtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/fyxO5UUrefZ9S+J35611sMDpHuXmlRV0zDBtFzDOI=;
        b=Kq6PczqXDIdu7mFnznToU0H+gC/OMsFR33KfD4HWCk/MJSifCxJ9zheEJ1nAUeyYZ0
         C0nyJQkXUYwDmh9Y1rqFDuCSPUewIrxgvttqBtUjr0GKKQkEPUYYJ1pUjSPOdWS75tWf
         35qv/VSg15kFOIU/Td9diZolnJa/z67pXexo0+tbswdNP793Ing7RNX9DCtg72ayhmjQ
         eKbSUYVghb9YpOaruTk7K8mtTA6OwSeuKSuvIgNRyjxfg/ji1Eep13hE02X4Nox2x/xR
         CpsgB/iYA2xivx3zQGHMAXW/hywwGsq/GsjvAaFfzm2FNQVuVnUG9WpjUEh88tLjwdz2
         2GSA==
X-Gm-Message-State: ACgBeo0d8m6UZh65i12ES5hmqxZcpzh/f0weuC/jvQJzE0Vhbund+Ulz
        5Ia6aYGRp9AySLNZ6n+7lbMSKw==
X-Google-Smtp-Source: AA6agR5O0DrK81VJ8xxEeNLWmXoFfFeD2gJu+76VOqk+ccUPS09sI/bRAbVrJYxn5te/7qBFWz6vcA==
X-Received: by 2002:ac2:4d29:0:b0:48a:eea7:4b92 with SMTP id h9-20020ac24d29000000b0048aeea74b92mr5781095lfk.400.1659955664258;
        Mon, 08 Aug 2022 03:47:44 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 03:47:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>,
        Robert Jones <rjones@gateworks.com>,
        Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few stale maintainers cleanup
Date:   Mon,  8 Aug 2022 13:47:07 +0300
Message-Id: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

A question:

Several of the bindings here had only one
maintainer and history does not always point to a new one (although I did not
perform extensive digging). I added subsystem maintainer, because dtschema
requires such entry. This is not the best choice as simply subsystem maintainer
might not have the actual device (or its datasheets or any interest in it).

However dtschema requires a maintainer. Maybe we could add some
"orphaned" entry in such case?

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: iio: Drop Joachim Eastwood
  dt-bindings: iio: Drop Bogdan Pricop
  dt-bindings: Drop Beniamin Bia and Stefan Popa
  dt-bindings: Drop Robert Jones
  dt-bindings: Drop Dan Murphy

 Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 1 -
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml    | 2 +-
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml      | 3 +--
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml   | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml    | 2 +-
 .../devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml        | 1 -
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml    | 2 +-
 .../devicetree/bindings/leds/leds-class-multicolor.yaml        | 2 +-
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml        | 2 +-
 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml       | 1 -
 Documentation/devicetree/bindings/net/ti,dp83822.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83867.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83869.yaml          | 2 +-
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml    | 1 -
 Documentation/devicetree/bindings/power/supply/bq25980.yaml    | 1 -
 Documentation/devicetree/bindings/sound/tas2562.yaml           | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml     | 2 +-
 19 files changed, 13 insertions(+), 20 deletions(-)

-- 
2.34.1

