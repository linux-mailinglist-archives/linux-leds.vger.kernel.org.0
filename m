Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1D325F289
	for <lists+linux-leds@lfdr.de>; Mon,  7 Sep 2020 06:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgIGEfq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Sep 2020 00:35:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50567 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgIGEfo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2020 00:35:44 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.148]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mz9EL-1kSX8A19FL-00wDcn; Mon, 07 Sep 2020 06:35:25 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kF8s9-0003Dm-FZ; Mon, 07 Sep 2020 06:35:22 +0200
Received: (nullmailer pid 3024 invoked by uid 2001);
        Mon, 07 Sep 2020 04:35:17 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v3 0/2] leds: pwm: Make automatic labels work
Date:   Mon,  7 Sep 2020 06:34:57 +0200
Message-Id: <20200907043459.2961-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 2c58665afdcdd1fd53023359626f008f
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:ScF1MQBk/AxpO1TWNpfRufpoudosd15+nmSnLm6gHtoc7zrSKvF
 jW14Xh+XfCi7fdwBHt/UW3VFVWXOQCDH/+QJeiddO+MiKU3XDiXFWww16P1YYA5Jvqg97Fl
 bkpf72GS1tLcMXmT/5u8+xCSs6I/aR+ShysJmJEmE5bse1LbV9hM0LA/YQAOXO5bG3wg3z2
 qpAaQfgoBgnyjKD1YzZIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VpvWmfjSw+o=:nkm2EC8sQhLHJ5EPlDcbNo
 4sim7YjjgHexPfF4upka/bWF/Nv8AwBDLZFZNc7G1nYy9y47nprnfmJLNrRj9RA2HfH/c7UYp
 GNv5wKhv1rVrsQ+2sXqgw7xdVdgxbda7Df4xRyYvC7wx5TxhK9Gco1BuieaolmDebaQrPnGLe
 AfQ5TdIV9VbdMX5Nbla9Z2Qn/xO/5fXctw4gKtwsvsDgU+Ao3xckvUS3URaEC8nMBAPZ2RHcG
 haNCgZx1UxcZAK0ekpyp0Yxek1yh7ZQs1j+6eu9nRaI/plWyvlpcNEvFBUuJh9TmC+pI4XcgB
 MuDRhtJLt2K7drs6vWescGjk3NxTtyVA9P+Gp8wrYINs1MFikfjfunCZkcQGgzmUyNr9lkgWo
 aolvlp877zjcj4AtoZoQYx47tF3663mRtRN1A9dbDwdGCNc/yS5NA5WyZfTVM89qp7DPtFV7A
 nO689lyjfa/wsXK7x8FDAdNL9hvS0uZI5x0r7hxTnp/33KaOj2VNifvS9zhQDezApyF2CUbas
 0zi2mvZ9/AeHjRn144CF9ENktHNvd35UJzZh9ugTH3Ytp1IyuaTAKZTImMidL8QmYGNZUAmsb
 jiVY/EOFPc+zxl6sIDL3F8IMfR1Op7VIowB2RdsL2ygjlfeFAGom/gE9/VO/Rw0I/bpI6MTbu
 z9kIJa9/O5qkt+ASWu+pfZ013XZoqoWLSjUTCF/hXS3D28bU5i8spvKsFZ+Qy0uJFtOqrsAEz
 g3L1uA5kKY4QDjDKY8ZZ7V/g/uaMSnmDRU/oqcmHRMErff1lkZucja5iCb6rx2lZiKcutb9HW
 CoNdDyFXNaJbBWCh28vhvaLi1it0wYGBkD8ljxY5tXpuOwMynzXPR6ecSURFtn4coYi4BPy
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not yet work for the 'leds-pwm' driver.
This series fixes the driver and takes the opportunity to update the
dt-bindings accordingly.

v3:
- rebased on v5.9-rc4
- changed license of .yaml file to recommended one
- added Acked-by

v2:
- rebased on v5.9-rc3
- added the dt-bindings update patch

v1:
- based on v5.9-rc2
- backport on v5.4.59 tested and working

Greets
Alex

Alexander Dahl (2):
  leds: pwm: Allow automatic labels for DT based devices
  dt-bindings: leds: Convert pwm to yaml

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
 drivers/leds/leds-pwm.c                       |  9 +-
 3 files changed, 93 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml

-- 
2.20.1

