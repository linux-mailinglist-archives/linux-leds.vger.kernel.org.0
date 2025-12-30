Return-Path: <linux-leds+bounces-6504-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE78CE9A25
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 13:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E87301E925
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 12:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013942EB5B8;
	Tue, 30 Dec 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxBhEj0V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BD2EAB61;
	Tue, 30 Dec 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097177; cv=none; b=A+rexc6O1Dj+04PIGRIofyjrEoSExMfWlfHd/U+6NjSXjJtMxIshAZdxXO6rlXqL/IH2k9F1oFCn0QpWUZR7abVBIclYWpu4NMeVM0UijPZIVx7/wyW1dZj5DSrrTlEm7/l3e19LWdDcyQrjVvBB2MQNvIBicW+7Zhl5jymOi6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097177; c=relaxed/simple;
	bh=eAIbervwDL1sYnYddf5ZLtcglQDWAa4e8QOFmTRFzI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0/D0C80SdUTLx7LldfFs9XHag29wOE8AQj3V8tR8+oNIksFjJf3YJa89DeRc+XSRH/5swsdO91U6R+70Ov7ExEiB9rM7e99KcQblZE91s0QvpiWFDMN2nRMDt9fE5PeqKK+GWkaoJlRKYVs+6a+XqiMxD2wNJtdkvEKitgqsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxBhEj0V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767097175; x=1798633175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eAIbervwDL1sYnYddf5ZLtcglQDWAa4e8QOFmTRFzI8=;
  b=AxBhEj0Vtexgi4geSJfUfITeMsxaTTxX+yVLe2UxX6LUx3Cka6y9ImCO
   p5UKnGkYe7wJEtoH9f9xZtcIhowjE4HJf9cbUjuqZ5axCPSJMbPsy2jpS
   J359zaz9qAhVBgGqE2XvaxKrIgbrtfxhBiFaAmqfT5uT7iu15iLWa3FsO
   ewkTLdKcvFNWtjZwGDjDcnwNWa8syEgB6IbubHj9QsBODYfxO0VANwzSc
   Emj3j4PDLF7FRy5ejZ544gIDhdWcnicxC2Jo2CmXoZdqwsqrKM8ZkAX3g
   YHkdpa+SJS0w+kLV/PdCcoj7H/RcLikZo1q27ZijlYDayPFEM/4DYm+z0
   w==;
X-CSE-ConnectionGUID: CzsO0j6pR7Cek61zrrqtsA==
X-CSE-MsgGUID: AOLiNDEiSBm7uRRjkyA6Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68578817"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68578817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:19:35 -0800
X-CSE-ConnectionGUID: iX9arSfaTeeyyexzXOO7xQ==
X-CSE-MsgGUID: NaqYu8smRSiwlWKmzUYZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200957880"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:19:31 -0800
Date: Tue, 30 Dec 2025 14:19:29 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 7/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <aVPDUVNX95Hv13VU@smile.fi.intel.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20251230082336.3308403-8-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230082336.3308403-8-professorjonny98@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 09:23:20PM +1300, Jonathan Brophy wrote:
> 
> Add a driver that implements virtual LED groups with priority-based
> arbitration for shared physical LEDs. The driver provides a multicolor
> LED interface while solving the coordination problem when multiple
> subsystems need to control the same physical LEDs.
> 
> Key features:
> 
> Winner-takes-all arbitration:
> - Only virtual LEDs with brightness > 0 participate
> - Highest priority wins (sequence number tie-breaking)
> - Winner controls ALL physical LEDs
> - Non-winner LEDs are turned off
> 
> Multicolor LED ABI support:
> - Full compliance with standard multicolor LED interface
> - Deterministic channel ordering by LED_COLOR_ID
> - Two modes: multicolor (dynamic) and standard (fixed-color)
> - Per-channel intensity and master brightness control
> 
> Memory optimization:
> - Conditional debug compilation (~30% size reduction when disabled)
> - Pre-allocated arbitration buffers
> - Efficient O(1) physical LED lookup via XArray
> - ~200 bytes per virtual LED in production builds
> 
> Locking design:
> - Hierarchical lock acquisition order prevents deadlocks
> - Lock-free arbitration with atomic sequence numbers
> - Temporary lock release during hardware I/O to allow concurrency
> 
> Hardware support:
> - GPIO, PWM, I2C, and SPI LED devices
> - Automatic physical LED discovery and claiming
> - Global ownership tracking prevents conflicts
> - Power management with suspend/resume
> 
> Debugfs telemetry (CONFIG_DEBUG_FS):
> - Arbitration statistics and latency metrics
> - Per-LED win/loss counters
> - Physical LED state inspection
> - Stress testing interface
> 
> Module parameters:
> - use_gamma_correction: Perceptual brightness (gamma 2.2)
> - update_delay_us: Rate limiting for slow buses
> - max_phys_leds: Buffer capacity (default 64)
> - enable_update_batching: 10ms coalescing for rapid changes
> 
> Typical use cases:
> - System status with boot/error priority levels
> - RGB lighting with coordinated control
> - Multi-element LED arrays (rings, strips)

...

> +/*
> + * leds-group-virtualcolor.c - Virtual grouped LED driver with Multicolor ABI

No name of the file in the file itself, please. This is proven to be often
forgotten if file name is changed.

> + *
> + * This driver is fully compliant with the multicolor LED ABI.
> + * It adds a policy layer to arbitrate shared physical LEDs,
> + * a problem not addressed by the LED core, without changing userspace-visible behavior.
> + * these additional extensions introduce new capabilities, such as:
> + *
> + * - Priority-based arbitration for shared physical LED ownership
> + * - Sequence/timestamp tie-breaking for deterministic conflict resolution
> + * - Runtime reconfiguration of shared channels for grouped LEDs
> + * - Atomic multi-device updates to ensure consistency
> + * - Group-wide brightness propagation and scaling
> + * - Support for arbitrated updates from multiple virtual LEDs to shared physical LEDs
> + * - Dynamic reallocation and resolution of conflicting virtual-to-physical mapping
> + *
> + * Priority-based arbitration resolves conflicts when multiple virtual LEDs
> + * reference the same physical LEDs. Arbitration rules are:
> + *   1. Priority value of led (higher wins)
> + *   2. Priority value of virtual controller (higher wins)
> + *   3. Sequence number for tie-breaking (most recent wins)
> + *   4. Winner-takes-all: ONE virtual LED controls ALL physical LEDs
> + *
> + * MC channel multipliers add advanced capabilities to LEDs, including:
> + * - Adjusting the relative brightness levels of different color channels
> + * - Normalizing output across different hardware vendors and physical configurations
> + * - Manipulating color temperature by changing the balance between channels
> + * - Avoiding overdriving specific channels unnecessarily
> + * - Mapping physical LEDs to application-specific color spaces and intensities
> + * - Emulating single fixed-color LEDs from multicolor LEDs
> + * - Dynamic reconfiguration of output characteristics
> + * - Capping brightness levels to suit specific use cases
> + *
> + * Winner-Takes-All Arbitration:
> + *   - Only vLEDs with brightness > 0 participate
> + *   - Highest priority wins (ties broken by sequence number)
> + *   - Winner controls ALL physical LEDs
> + *   - Physical LEDs not used by the winner are turned off
> + *
> + * Locking hierarchy (must be acquired in this order):
> + *   1. vcolor_controller.lock (per-controller)  ← Controller FIRST
> + *   2. global_owner_rwsem (global)             ← Global SECOND
> + *   3. virtual_led.lock (per-vLED)
> + *
> + * Never hold vLED locks during arbitration to avoid deadlock.
> + * Arbitration copies vLED state under the vLED lock, then releases locks
> + * before proceeding to core processing.
> + *
> + * Device Tree Dependency:
> + * This driver requires Device Tree (CONFIG_OF) due to LED phandle resolution.
> + * GPIO LEDs, in particular, rely on OF-specific APIs, as they lack full
> + * fwnode support. Minimal `CONFIG_OF` usage ensures easy migration to ACPI
> + * when fwnode abstraction improves. Key operations include:
> + *   - `of_led_get()` - Called for LED phandle resolution within the single
> + *                      bridge function `vcolor_led_from_fwnode()`.
> + *   - `device_for_each_child_node()` for child iteration
> + *   - `fwnode_property_*()` for property access
> + *   - `fwnode_handle_get/put()` for reference management
> + *
> + * By isolating OF dependency in the bridge function, migration to
> + * `fwnode_led_get()` will be straightforward when supported by the LED subsystem.
> + *
> + * Author: Jonathan Brophy <professor_jonny@hotmail.com>

I would rather split this administrative meta information with the real doc.

/*
 * Copyright, Authorship, etc.
 */

/*
 * Top level documentation, may even be kernel-doc format (see DOC: prefix
 * for that).
 */

> + */

...

> +#include <linux/atomic.h>
> +#include <linux/compiler.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>

> +#include <linux/device.h>

> +#include <linux/err.h>

> +#include <linux/kernel.h>

No way you need this header.

> +#include <linux/kref.h>
> +#include <linux/ktime.h>
> +#include <linux/leds.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>

> +#include <linux/of_platform.h>

Why? You was thinking of mod_devicetable.h perhaps?

> +#include <linux/platform_device.h>

> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>

> +#include <linux/property.h>

> +#ifdef CONFIG_DEBUG_FS
> +  #include <linux/random.h>
> +#endif

> +#include <linux/ratelimit.h>
> +#include <linux/rwsem.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/xarray.h>

...

> +#ifdef CONFIG_DEBUG_FS
> +  #define MAX_DEBUGFS_NAME 96 /* Sized for "function:color-multicolor-##" + vLED name */
> +#endif

Unneeded ifdeffery.

...

> +#ifdef CONFIG_LOCKDEP
> +  #define assert_controller_locked(lvc) lockdep_assert_held(&(lvc)->lock)
> +  #define assert_vled_locked(vled) lockdep_assert_held(&(vled)->lock)
> +#else
> +#define assert_controller_locked(lvc) ((void)(lvc))
> +#define assert_vled_locked(vled) ((void)(vled))
> +#endif

Why?! Doesn't lockdep have already stubs?

> +/* Structured logging macros */
> +#define ctrl_err(lvc, fmt, ...) \
> +	dev_err(&(lvc)->pdev->dev, "[CTRL] " fmt, ##__VA_ARGS__)
> +
> +#define ctrl_warn(lvc, fmt, ...) \
> +	dev_warn(&(lvc)->pdev->dev, "[CTRL] " fmt, ##__VA_ARGS__)
> +
> +#define ctrl_info(lvc, fmt, ...) \
> +	dev_info(&(lvc)->pdev->dev, "[CTRL] " fmt, ##__VA_ARGS__)
> +
> +#define ctrl_dbg(lvc, fmt, ...) \
> +	dev_dbg(&(lvc)->pdev->dev, "[CTRL] " fmt, ##__VA_ARGS__)
> +
> +#define arb_err(lvc, fmt, ...) \
> +	dev_err_ratelimited(&(lvc)->pdev->dev, "[ARB] " fmt, ##__VA_ARGS__)
> +
> +#define vled_err(vled, fmt, ...) \
> +	dev_err(&(vled)->ctrl->pdev->dev, "[vLED:%s] " fmt, (vled)->name, ##__VA_ARGS__)

This usually is not required. You probably missed dev_fmt() macro.

...

> +/* Module parameters */
> +#ifdef CONFIG_DEBUG_FS
> +static bool enable_debugfs = true;
> +#else
> +static bool enable_debugfs;
> +#endif

Huh?! We don't need this as module parameter. Sure.

...

> +static inline unsigned long get_stable_led_key(struct led_classdev *cdev)
> +{
> +	if (!cdev)
> +		return 0;
> +
> +	/* GPIO LEDs don't have dev - use cdev pointer as key */
> +	if (cdev->dev)
> +		return (unsigned long)cdev->dev;
> +	else
> +		return (unsigned long)cdev;
> +}

This is magic that needs a good comment explaining all this voodoo pointer castings.

...

> +static inline bool controller_safe_arbitrate(struct vcolor_controller *lvc)
> +{
> +	bool ran;
> +
> +	if (!lvc)
> +		return false;
> +
> +	/* Fast path: avoid lock acquisition if nothing to do */
> +	if (atomic_read(&lvc->removing))
> +		return false;
> +
> +	/* FIX: Queue deferred arbitration if rebuilding */
> +	if (atomic_read(&lvc->rebuilding)) {
> +		lvc->needs_arbitration = true;
> +		return false;
> +	}

> +	mutex_lock(&lvc->lock);

I don't see unlock. Have you run sparse?

> +	/* Check suspended under lock to prevent suspend race */
> +	ran = false;
> +	if (!lvc->suspended && !atomic_read(&lvc->rebuilding) &&
> +		device_is_registered(&lvc->pdev->dev)) {
> +		controller_run_arbitration_and_update(lvc);
> +		ran = true;
> +	}
> +
> +	/* FIX: Lock was released by controller_run_arbitration_and_update */

Then at least you should add annotations for sparse.

> +	return ran;
> +}
> +
> +

Single blank line is enough.

> +/*

It looks like a kernel-doc, but not marked so. Any reason why this is done?

> + * parse_leds_fwnode_array - Parse LED references using fwnode APIs
> + * @dev: Device for logging and memory allocation
> + * @fwnode: Firmware node containing LED references
> + * @propname: Property name (e.g., "leds")
> + * @out_leds: Output array of LED classdev pointers
> + * @out_devs: Output array of device pointers (may contain NULLs for GPIO LEDs)
> + * @out_count: Number of LEDs found
> + *
> + * Uses fwnode APIs for property traversal, with a single OF bridge for LED resolution.
> + * This pattern mirrors V4L2's approach and makes future fwnode_led_get() migration trivial.
> + */
> +static int parse_leds_fwnode_array(struct device *dev,
> +				   const struct fwnode_handle *fwnode,
> +				   const char *propname,
> +				   struct led_classdev ***out_leds,

When I see triple pointers, my first thought that the data structures are badly
designed.

> +				   struct device ***out_devs,
> +				   u8 *out_count)
> +{
> +	struct fwnode_reference_args args;
> +	int count, idx, valid, i;
> +	struct led_classdev **leds;
> +	struct device **devs;
> +	struct led_classdev *cdev;
> +	struct device *led_dev;
> +	int ret;
> +
> +	*out_leds = NULL;
> +	*out_devs = NULL;
> +	*out_count = 0;
> +
> +	/* Count phandle references using generic fwnode API */
> +	count = 0;
> +	while (fwnode_property_get_reference_args(fwnode, propname,
> +						  NULL, 0, count, &args) == 0) {
> +		fwnode_handle_put(args.fwnode);
> +		count++;
> +	}
> +
> +	if (count <= 0)
> +		return 0;

> +	/* Allocate temporary arrays for LED/device pointers */
> +	leds = kcalloc(count, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	devs = kcalloc(count, sizeof(*devs), GFP_KERNEL);
> +	if (!devs) {
> +		kfree(leds);

Have you considered using __free() and no_free_ptr()?

> +		return -ENOMEM;
> +	}
> +
> +	/* Iterate through each LED reference and PACK valid entries */
> +	valid = 0;
> +	for (idx = 0; idx < count; idx++) {
> +
> +   /*Resolve LED from fwnode using index.*/

Wrong indentation and style of the one-line comment.

> +		cdev = fwnode_led_get(fwnode, idx, &led_dev);
> +
> +		if (IS_ERR(cdev)) {
> +			ret = PTR_ERR(cdev);
> +
> +			/* Handle deferred probe - cleanup and return immediately */
> +			if (ret == -EPROBE_DEFER) {
> +				dev_info(dev, "LED %d not ready yet (EPROBE_DEFER), will retry\n", idx);
> +
> +				/* Release all previously acquired LEDs and devices */
> +				for (i = 0; i < valid; i++) {
> +					if (leds[i])
> +						led_put(leds[i]);
> +					if (devs[i])
> +						put_device(devs[i]);
> +				}
> +
> +				kfree(leds);
> +				kfree(devs);
> +				return -EPROBE_DEFER;
> +			}
> +
> +			/* Other errors - log and skip this LED */
> +			dev_warn(dev, "Failed to resolve LED %d: %d\n", idx, ret);
> +			continue;
> +		}
> +
> +		/* Store valid LED in PACKED position */
> +		if (is_valid_led_cdev(cdev)) {
> +			leds[valid] = cdev;	  /* Pack at 'valid' index, not 'idx' */
> +			devs[valid] = led_dev;   /* May be NULL for GPIO LEDs */
> +			valid++;
> +		} else {
> +			dev_warn(dev, "LED %d is not valid (no brightness_set method)\n", idx);
> +			led_put(cdev);
> +			if (led_dev)
> +				put_device(led_dev);
> +		}
> +	}
> +
> +	/* Check if we got any valid LEDs */
> +	if (valid == 0) {
> +		dev_warn(dev, "Property '%s': none of %d LED(s) resolved\n",
> +			 propname, count);
> +		kfree(leds);
> +		kfree(devs);
> +		return -ENODEV;
> +	}
> +
> +	/* Success - return PACKED arrays to caller */
> +	*out_leds = leds;
> +	*out_devs = devs;
> +	*out_count = (u8)valid;
> +
> +	return 0;
> +}

...

> +static const u8 gamma_table[256] = {
> +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4,
> +	4, 4, 5, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 11, 11, 11, 12, 12, 13, 13, 14,
> +	14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 22, 23, 23, 24, 25, 25, 26,
> +	26, 27, 28, 28, 29, 30, 30, 31, 32, 32, 33, 34, 34, 35, 36, 37, 37, 38, 39, 40, 40, 41,
> +	42, 43, 44, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
> +	63, 64, 65, 66, 67, 68, 70, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 84, 85, 86, 87,
> +	89, 90, 91, 92, 94, 95, 96, 97, 99, 100, 101, 103, 104, 105, 107, 108, 109, 111, 112,
> +	114, 115, 116, 118, 119, 121, 122, 123, 125, 126, 128, 129, 131, 132, 134, 135, 137,
> +	138, 140, 141, 143, 144, 146, 147, 149, 150, 152, 154, 155, 157, 158, 160, 162, 163,
> +	165, 167, 168, 170, 172, 173, 175, 177, 178, 180, 182, 184, 185, 187, 189, 191, 192,
> +	194, 196, 198, 200, 201, 203, 205, 207, 209, 211, 212, 214, 216, 218, 220, 222, 224,
> +	226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 253, 255
> +};

This is utterly unreadable and unmaintainable.

Just make them to be a fixed number per line (usually power of 2, like 8 or 16)
with an index comment, like

	0, 0, 0, 0, 0, 0, 0, 0,				/*   0 -   8 */
	...
	240, 242, 244, 246, 248, 250, 253, 255,		/* 248 - 255 */

...

> +module_param(enable_debugfs, bool, 0444);
> +MODULE_PARM_DESC(enable_debugfs,
> +	"Enable debugfs interface for telemetry and testing (default: Y if CONFIG_DEBUG_FS)");
> +
> +module_param(use_gamma_correction, bool, 0644);
> +MODULE_PARM_DESC(use_gamma_correction,
> +	"Apply 2.2 gamma correction to brightness values (default: N)");
> +
> +module_param(update_delay_us, uint, 0644);
> +MODULE_PARM_DESC(update_delay_us,
> +	"Artificial delay in microseconds after each LED update batch (default: 0, max: 1000000)");
> +
> +module_param(max_phys_leds, uint, 0444);
> +MODULE_PARM_DESC(max_phys_leds,
> +	"Maximum unique physical LEDs per controller (default: 64, range: 1-1024)");
> +
> +module_param(enable_update_batching, bool, 0644);
> +MODULE_PARM_DESC(enable_update_batching,
> +	"Batch brightness updates with 10ms delay to reduce CPU overhead (default: N)");

No module parameters in a new code, please.

...

I stopped with this, this patch is half-baked and unreviewable. Please, split
it to a few features and add one-by-one, for example:

- very basic sypport
- feature A
- ...
- debugfs

So I expect 3+ patches out of this one. And try to keep size of a change less
than 1000 LoCs.

-- 
With Best Regards,
Andy Shevchenko



