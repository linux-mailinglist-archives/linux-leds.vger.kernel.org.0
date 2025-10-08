Return-Path: <linux-leds+bounces-5676-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5366BC6411
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 20:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685D84065DF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 18:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3502C15BB;
	Wed,  8 Oct 2025 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lh8KWDC+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A112C0F9A
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947058; cv=none; b=s/oIsGW6+GeLVF5FZ0DLT1IxcyuqqQnxVSZU1pjQcAitXkIRaYE/OOOxERH+JdjZyYinivsX5zskE24wpm/fnMphWNBt3pDMImqXj49EGjeYcWUkTjkbiw+1ydQzRVaOdPUNOZvZUg5qOBn8yQdoddx84/8VWsSlbONr4AE4Kqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947058; c=relaxed/simple;
	bh=6l/3GTLT2UydYiP55+oG+smz/WuH5npHBY+AV/7yf14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOfni1bO820ULs24amAY/YY5cVr4bJHdbVaJk/UCYzM2LedmujVBJJe6jaGsCrubeT25HFu0/QyphgbIb/sM1kzWutcWydHSNFlVvMCkUt0nMfaJaiWOz33Biiy4XD13Il0XFuYhSfalkxvjlNWN7JHimULrYtLTY1tMJOE28hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lh8KWDC+; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D12A3240028
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 20:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1759947050; bh=PPe7UKsklAFbVGgif5GZJ8GIADSBA74PnnS80wLjF0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=lh8KWDC+bLjGQx5Wi9iOBsIkSXLYxT7S+pPXJDRZ2KA/ksCQWccjj9DovtuI5MZ24
	 A3pBYCF54zHGnfyog0dFMb7vV1ydb4HLNIYXxkhQ9GU1bSoHUjpEX5IYGjSEaPwPPk
	 i9+3pFiwTO2/EmAGqn6/o6aWv1Je0jdUZXeU6f2LvDR5RNcmxGhf2ZNOe8b9RYWYz1
	 s2zjyl1cYbC1hDg2Uxg41jAG3vKxABNbopLSCAdsccWI7aB8E+MwJickB1bAIXL8fB
	 Cz+lmiR+cwpob0+E5hQLn4az1pWbt3cOh+nYGx/wY6bhznB0WOcEMVQV6yKjkJ0DyE
	 gCeB2Q2dD8ExQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4chgzX1Hr6z9rxK;
	Wed,  8 Oct 2025 20:10:48 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Markus Probst <markus.probst@posteo.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-leds@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] leds: add driver for synology atmega1608 controlled LEDs
Date: Wed, 08 Oct 2025 18:10:49 +0000
Message-ID: <20251008181027.662616-5-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-4-markus.probst@posteo.de>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

The Atmega1608 is a microcontroller used by synology devices to control
leds via the i2c bus. It can handle up to 24 leds.

Successfully tested on a Synology DS923+.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                     |   6 +
 drivers/leds/Kconfig            |   9 +
 drivers/leds/Makefile           |   1 +
 drivers/leds/leds_atmega1608.rs | 377 ++++++++++++++++++++++++++++++++
 4 files changed, 393 insertions(+)
 create mode 100644 drivers/leds/leds_atmega1608.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 5881ef69c1d7..c6065751fa15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24401,6 +24401,12 @@ F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
 F:	include/uapi/linux/sync_file.h
 
+SYNOLOGY ATMEGA1608 LED CONTROLLER DRIVER
+M:	Markus Probst <markus.probst@posteo.de>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/leds_atmega1608.rs
+
 SYNOPSYS ARC ARCHITECTURE
 M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e3dce7e35a4..d04914896235 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -323,6 +323,15 @@ config LEDS_WRAP
 	help
 	  This option enables support for the PCEngines WRAP programmable LEDs.
 
+config LEDS_ATMEGA1608
+	tristate "LED Support for Atmega1608 used in Synology devices"
+	depends on LEDS_CLASS
+	depends on I2C
+	depends on RUST
+	help
+	  This option enables support for the Atmega1608 microcontroller used
+	  as led controller in synology devices.
+
 config LEDS_COBALT_QUBE
 	tristate "LED Support for the Cobalt Qube series front LED"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 9a0333ec1a86..5c1a91344980 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_LEDS_UPBOARD)		+= leds-upboard.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
+obj-$(CONFIG_LEDS_ATMEGA1608)		+= leds_atmega1608.o
 
 # Kinetic ExpressWire Protocol
 obj-$(CONFIG_LEDS_EXPRESSWIRE)		+= leds-expresswire.o
diff --git a/drivers/leds/leds_atmega1608.rs b/drivers/leds/leds_atmega1608.rs
new file mode 100644
index 000000000000..495b6105de04
--- /dev/null
+++ b/drivers/leds/leds_atmega1608.rs
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Led Driver for Synology devices using Atmega1608 as Led Controller.
+//!
+//! Atmega1608 is a microcontroller from Microchip Technology, it is used
+//! as a led controller in synology nas devices.
+//!
+//! It can handle a total of 24 leds. Each led has 4 modes:
+//! * OFF - the led is turned off
+//! * ON - the led is turned on at full brightness
+//! * DIM0 - custom brightness and optional hardware accelerated blinking
+//!
+//! there should also be DIM1 (which should do the same as DIM0), but
+//! according to my own testing it doesn't actually work, so it won't be used.
+//!
+//!
+//! # Limitations
+//!
+//! DIM0 (and DIM1) are shared across all leds, meaning if DIM0 is used by
+//! multiple leds, these multiple leds cannot have different brightness
+//! levels. The same does apply for the hardware accelerated blinking.
+//!
+//! In other words, for all 24 leds there can either only be one brightness other
+//! than 0 and 255, or one hardware accelerated blinking delay.
+//!
+//! Furthermore the off and on delay in hardware accelerated blinking cannot
+//! have different values and have to be equal. We solve this by calculating
+//! the average of those numbers and use it as delay for both. The delay
+//! cannot be larger than 765 ms (255*3).
+//!
+//! While hardware accelerated blinking is on, the led cycles between
+//! the current brightness for the mode and full brightness. Because of this
+//! behaviour, we hardcode the brightness value of 128 if hardware accelerated
+//! blinking is used.
+//!
+//!
+//! # Technical details
+//!
+//! The controller has 6 8-bit i2c registers for led modes. See [`Atmega1608LedAddress`].
+//! Each led has its own 2 bits:
+//!
+//! +=====================================+
+//! | Register  | Leds (2 bits each)      |
+//! +=====================================+
+//! | 0x06      | LED3  LED2  LED1  LED0  |
+//! |-----------+-------------------------+
+//! | 0x07      | LED7  LED6  LED5  LED4  |
+//! |-----------+-------------------------+
+//! | 0x08      | LED11 LED10 LED9  LED8  |
+//! |-----------+-------------------------+
+//! | 0x09      | LED15 LED14 LED13 LED12 |
+//! |-----------+-------------------------+
+//! | 0x0A      | LED19 LED18 LED17 LED16 |
+//! |-----------+-------------------------+
+//! | 0x0B      | LED23 LED22 LED21 LED20 |
+//! |=====================================+
+//!
+//! See [`Atmega1608LedMode`] for the value of each mode.
+//!
+//!
+//! +===============================================+
+//! | Register  | Mode / Meaning                    |
+//! +===============================================+
+//! | 0x01      | turns all leds off if set to 1    |
+//! +-----------------------------------------------+
+//! | 0x02      | blinking delay for Dim0, 1 = 3 ms |
+//! +-----------------------------------------------+
+//! | 0x03      | brightness for Dim0, inverted     |
+//! +-----------------------------------------------+
+//! | 0x04      | blinking delay for Dim1, 1 = 3 ms |
+//! +-----------------------------------------------+
+//! | 0x05      | brightness for Dim1, inverted     |
+//! +===============================================+
+//!
+
+use kernel::{
+    alloc::kvec::KPinnedVec,
+    c_str,
+    error::code::EINVAL,
+    i2c::{self, I2cClient},
+    led::{LedClassDev, LedHandler, LedInitData},
+    new_mutex,
+    prelude::*,
+    str::CString,
+    sync::{Arc, Mutex},
+    types::ARef,
+};
+
+struct Atmega1608LedDriver {
+    client: ARef<I2cClient>,
+    #[expect(
+        dead_code,
+        reason = "leds should be unregistered on device/driver removal"
+    )]
+    leds: KPinnedVec<LedClassDev>,
+}
+
+kernel::module_i2c_driver! {
+    type: Atmega1608LedDriver,
+    name: "atmega1608",
+    authors: ["Markus Probst <markus.probst@posteo.de>"],
+    description: "Led Driver for Synology devices using Atmega1608 as Led Controller",
+    license: "GPL v2",
+}
+
+#[repr(u8)]
+#[derive(Copy, Clone)]
+enum Atmega1608LedAddress {
+    Ls0 = 0x06,
+    Ls1 = 0x07,
+    Ls2 = 0x08,
+    Ls3 = 0x09,
+    Ls4 = 0x0A,
+    Ls5 = 0x0B,
+}
+
+#[repr(u8)]
+#[derive(Copy, Clone)]
+enum Atmega1608LedId {
+    Sel0 = 0,
+    Sel1 = 1,
+    Sel2 = 2,
+    Sel3 = 3,
+}
+
+#[repr(u8)]
+#[derive(Copy, Clone, PartialEq, Eq)]
+enum Atmega1608LedMode {
+    Off = 0b00,
+    On = 0b01,
+    Dim0 = 0b10,
+    #[allow(dead_code)]
+    Dim1 = 0b11,
+}
+
+struct Atmega1608Led {
+    addr: Atmega1608LedAddress,
+    id: Atmega1608LedId,
+
+    client: ARef<I2cClient>,
+
+    mode_lock: Arc<Mutex<()>>,
+}
+
+kernel::of_device_table! {
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <Atmega1608LedDriver as i2c::Driver>::IdInfo,
+    [(kernel::of::DeviceId::new(c_str!("synology,atmega1608")), 0)]
+}
+
+impl i2c::Driver for Atmega1608LedDriver {
+    type IdInfo = u32;
+
+    const OF_ID_TABLE: Option<kernel::of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &I2cClient<kernel::device::Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> Result<Pin<KBox<Self>>> {
+        let idev = pdev.as_ref();
+
+        let Some(fwnode) = idev.fwnode() else {
+            return Err(EINVAL);
+        };
+
+        let client: ARef<I2cClient> = pdev.into();
+
+        client
+            .write_byte_data(1, 0)
+            .inspect_err(|err| dev_err!(idev, "unable to remove led mask: {err:?}\n"))?;
+
+        let mut leds = KPinnedVec::with_capacity(
+            Atmega1608LedAddress::VALUES.len() * Atmega1608LedId::VALUES.len(),
+            GFP_KERNEL,
+        )?;
+
+        let mut i = 0;
+        for addr in Atmega1608LedAddress::VALUES {
+            let mode_lock = Arc::pin_init(new_mutex!(()), GFP_KERNEL)?;
+
+            for id in Atmega1608LedId::VALUES {
+                let Some(child) =
+                    fwnode.get_child_by_name(&CString::try_from_fmt(fmt!("led@{i}"))?)
+                else {
+                    continue;
+                };
+
+                let client = ARef::clone(&client);
+                let mode_lock = Arc::clone(&mode_lock);
+
+                leds.push_pin_init(LedClassDev::new(
+                    Some(idev),
+                    None,
+                    LedInitData::new().fwnode(&child),
+                    Atmega1608Led {
+                        addr,
+                        id,
+                        client,
+
+                        mode_lock,
+                    },
+                ))?;
+                i += 1;
+            }
+        }
+        Ok(KBox::new(Self { client, leds }, GFP_KERNEL)?.into())
+    }
+}
+
+impl Drop for Atmega1608LedDriver {
+    fn drop(&mut self) {
+        let _ = self
+            .client
+            .write_byte_data(1, 1)
+            .inspect_err(|err| dev_err!(self.client.as_ref(), "unable to set led mask: {err:?}\n"));
+
+        for addr in Atmega1608LedAddress::VALUES {
+            let _ = self
+                .client
+                .write_byte_data(addr as u8, 0)
+                .inspect_err(|err| {
+                    dev_err!(
+                        self.client.as_ref(),
+                        "Unable to turn of leds at address {:#2x}: {err:?}\n",
+                        addr as u8
+                    )
+                });
+        }
+    }
+}
+
+impl Atmega1608LedAddress {
+    const VALUES: [Self; 6] = [
+        Self::Ls0,
+        Self::Ls1,
+        Self::Ls2,
+        Self::Ls3,
+        Self::Ls4,
+        Self::Ls5,
+    ];
+}
+
+impl Atmega1608LedId {
+    const VALUES: [Self; 4] = [Self::Sel0, Self::Sel1, Self::Sel2, Self::Sel3];
+
+    const fn mask(self) -> u8 {
+        match self {
+            Self::Sel0 => 0x03,
+            Self::Sel1 => 0x0C,
+            Self::Sel2 => 0x30,
+            Self::Sel3 => 0xC0,
+        }
+    }
+
+    const fn shift(self) -> u8 {
+        match self {
+            Self::Sel0 => 0,
+            Self::Sel1 => 2,
+            Self::Sel2 => 4,
+            Self::Sel3 => 6,
+        }
+    }
+}
+
+impl LedHandler for Atmega1608Led {
+    const BLOCKING: bool = true;
+    const BLINK: bool = true;
+    const MAX_BRIGHTNESS: u32 = 255;
+
+    fn brightness_set(&self, brightness: u32) -> Result<()> {
+        let brightness = u8::try_from(brightness).unwrap_or(255);
+
+        let mode = self.update_mode(match brightness {
+            0 => Atmega1608LedMode::Off,
+            255 | 254 => Atmega1608LedMode::On,
+            _ => Atmega1608LedMode::Dim0,
+        })?;
+
+        mode.update_prescale(&self.client, 0)?;
+        mode.update_pwm(&self.client, !brightness)?;
+
+        Ok(())
+    }
+
+    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize) -> Result<()> {
+        if *delay_on == 0 && *delay_off == 0 {
+            *delay_on = 90;
+            *delay_off = 90;
+        }
+        let avg = (*delay_on + *delay_off) / 2;
+        let prescale = avg / 3;
+        let prescale = u8::try_from(prescale).unwrap_or(255);
+
+        let delay = prescale as usize * 3;
+        *delay_on = delay;
+        *delay_off = delay;
+
+        let mode = self.update_mode(Atmega1608LedMode::Dim0)?;
+
+        mode.update_prescale(&self.client, prescale)?;
+        mode.update_pwm(&self.client, 127)?;
+
+        Ok(())
+    }
+}
+
+impl Atmega1608Led {
+    fn update_mode(&self, mode: Atmega1608LedMode) -> Result<Atmega1608LedMode> {
+        let _guard = self.mode_lock.lock();
+
+        let mut current = self
+            .client
+            .read_byte_data(self.addr as u8)
+            .inspect_err(|err| {
+                dev_err!(
+                    self.client.as_ref(),
+                    "failed to read {:#2x}: {err:?}\n",
+                    self.addr as u8
+                );
+            })?;
+
+        current =
+            (current & !self.id.mask()) | (((mode as u8) << self.id.shift()) & self.id.mask());
+
+        self.client
+            .write_byte_data(self.addr as u8, current)
+            .inspect_err(|err| {
+                dev_err!(
+                    self.client.as_ref(),
+                    "failed to write {:#2x}: {err:?}",
+                    self.addr as u8
+                );
+            })?;
+
+        Ok(mode)
+    }
+}
+
+impl Atmega1608LedMode {
+    fn update_prescale(self, client: &I2cClient, prescale: u8) -> Result<()> {
+        let addr = match self {
+            Self::Dim0 => 0x02,
+            Self::Dim1 => 0x04,
+            Self::Off | Self::On => return Ok(()),
+        };
+        client.write_byte_data(addr, prescale).inspect_err(|err| {
+            dev_err!(client.as_ref(), "failed to write {addr:#2x}: {err:?}",);
+        })
+    }
+
+    fn update_pwm(self, client: &I2cClient, pwm: u8) -> Result<()> {
+        let addr = match self {
+            Self::Dim0 => 0x03,
+            Self::Dim1 => 0x05,
+            Self::Off | Self::On => return Ok(()),
+        };
+        client.write_byte_data(addr, pwm).inspect_err(|err| {
+            dev_err!(client.as_ref(), "failed to write {addr:#2x}: {err:?}",);
+        })
+    }
+}
+
+impl From<u8> for Atmega1608LedMode {
+    fn from(value: u8) -> Self {
+        const ON: u8 = Atmega1608LedMode::On as u8;
+        const DIM0: u8 = Atmega1608LedMode::Dim0 as u8;
+        const DIM1: u8 = Atmega1608LedMode::Dim1 as u8;
+
+        match value {
+            ON => Self::On,
+            DIM0 => Self::Dim0,
+            DIM1 => Self::Dim1,
+            _ => Self::Off,
+        }
+    }
+}
-- 
2.49.1


